#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;


// Extra from 4a is to action::sort outputs of split
int main() {
    auto valids =ranges::getlines(std::cin) | view::transform(
        [](auto&&line) {
            std::vector<std::string> vec = view::split(line, ' ')
                | view::transform([](auto&&x){ return action::sort(x); });
            ranges::sort(vec);
            return ranges::adjacent_find(vec) == std::end(vec);
        });
    auto sum = ranges::accumulate(valids, 0);
    std::cout << sum << "\n";
}
