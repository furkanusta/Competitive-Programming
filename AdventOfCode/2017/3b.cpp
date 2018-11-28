// TODO: There are multiple issues:
// - last transform using sum_neighbors is not pure as it updates the board
// - uses lots of memory, there might be an alternative solution without holding the whole board
//   (other than copy-pasting OEIS sequence and just performing lookup)
// - Due to the lack of 'init' in partial_sum and accumulate/reduce in view::
//   I had to zip {0,1} only to be used for the first element
// - Transform|drop_while pipe calls the value that causes the transition twice,
//   which could cause a problem normally but in this case it is fine since executing sum_neighbors
//   multiple times with the same parameters (without nothing in-between) doesn't affect the answer.
//   is it partially idempotent?, hadn't that been the case int score=0 would be fine.
#include <iostream>
#include <string>
#include <vector>
#include <string_view>
#include <cassert>
#include <utility>
#include <map>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;


using position = std::pair<int, int>;
using grid = std::map<position, int>;

position move(position p, int direction) {
    if (direction == 0) {
        --p.first;
    } else if(direction == 1) {
        --p.second;
    } else if(direction == 2) {
        ++p.first;
    } else if(direction == 3) {
        ++p.second;
    }
    return p;
}

// board is not constant because operator[] modifies it, we could use .find() but this is shorter
int sum_neighbors(grid& board, const position& p) {
    int score = -board[p];
    for (int i = -1; i <= 1; i++)
        for (int j = -1; j <= 1; j++)
            score += board[{p.first + i, p.second + j}];
    return score;
}

int main(int argc, char** argv) {
    assert(argc == 2);
    int N = std::stoi(argv[1]);
    std::map<position, int> board;
    board[{0,0}] = 1;
    auto directions = view::ints(3, 7) | view::transform([](auto&&i) {return i%4;}) | view::cycle;
    auto distances = view::ints(1) | view::for_each([](auto&&i){ return view::repeat_n(i, 2); });
    auto xx = view::zip(distances, directions, view::repeat(position{0, 1}))
        | view::for_each([](auto&&i) {
                             return view::repeat_n(std::make_pair(std::get<1>(i), std::get<2>(i)),
                                                   std::get<0>(i));
                         })
        | view::partial_sum([](auto&&sum, auto&&i){
                                return std::make_pair(i.first, ::move(sum.second, i.first));
                            })
        | view::values
        | view::transform([&board](auto&&i){ return board[i] = sum_neighbors(board, i); })
        | view::drop_while([N](auto&&i) { return i < N; })
        | view::take_exactly(1)
        ;
    std::cout << xx << "\n";
}
