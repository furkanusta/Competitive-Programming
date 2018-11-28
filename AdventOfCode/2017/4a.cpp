#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;



int main() {
    auto valids =ranges::getlines(std::cin) | view::transform(
        [](auto&&line) {
            std::vector<std::string> vec = action::split(line, ' ') | action::sort;
            return ranges::adjacent_find(vec) == std::end(vec);
        });
    auto sum = ranges::accumulate(valids, 0);
    std::cout << sum << "\n";
}
