#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;

// Couldn't find a way to avoid std::string call, neither string_view,
// nor using view::split directly inside minmax_element works
int main() {
    auto diffs = view::transform(
        ranges::getlines(std::cin),
        [](auto&&line){
            std::vector<int> vec = view::split(line, ' ')
                | view::transform([](auto&&x){ return std::string(x); })
                | view::transform([](auto&&x){ return std::stoi(x); });
            std::pair mm  = ranges::minmax_element(vec);
            return *mm.second - *mm.first;
        });
    auto sum = ranges::accumulate(diffs, 0);
    std::cout << sum << '\n';
}
