#include <iostream>
#include <string>
#include <string_view>
#include <cassert>
#include <set>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;

// TODO: Check eliminating while loop or finding a better way to read ints
int main() {
    std::string line;
    std::cin >> line;
    std::vector<int> vec = view::split(line, '\t')
        | view::transform([](auto&&x){ return std::string(x); })
        | view::transform([](auto&&x){return std::stoi(x);});
    std::set<std::vector<int>> mark;
    int count = 0;
    while(mark.insert(vec).second) {
        count++;
        auto it = ranges::max_element(vec);
        int val = *it;
        *it = 0;
        auto dist = ranges::distance(vec.begin(), it);
        ranges::for_each(view::cycle(vec) | view::drop(dist+1) | view::take_exactly(val),
                         [](auto&x){ x++; });
    }
    std::cout << count << "\n";
}
