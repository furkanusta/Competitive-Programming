#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;


// TODO: Use odd squares instead: 1,9,25 ...
int main(int argc, char**argv) {
    assert(argc == 2);
    int N = std::stoi(argv[1]);

    auto v =  view::ints(0)
        | view::stride(2)
        | view::transform([](auto&&x){ return x == 0 ? 1 : 4 * x; })
        | view::partial_sum()
        | view::take_while([=](auto&&x){ return x < N; });
    auto to_center = ranges::distance(v);
    int dir[4];
    dir[0] = *ranges::next(v.begin(), to_center - 1) + to_center;
    for (int i = 1; i < 4; i++)
        dir[i] = dir[i-1] + 2 * to_center;
    auto outer = ranges::min_element(
        view::transform(dir, [=](auto&&x){return std::abs(N - x);})).get_unsafe();
    std::cout << to_center + *outer << "\n";
}
