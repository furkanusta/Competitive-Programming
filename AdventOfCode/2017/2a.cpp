#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;

// Doesn't check for empty string etc.
// For some reason requires action::split couldn't use view::split with transform
int main() {
    std::string line;
    int sum = 0;
    while(std::getline(std::cin, line)) {
        auto vec = action::split(line, '\t');
        std::pair mm  = ranges::minmax_element(
            vec
            | view::transform([](auto&&x){ return std::string(x.begin(), x.end()); })
            | view::transform([](auto&&x){ return std::stoi(x); })).get_unsafe();
        sum += *mm.second - *mm.first;
    }
    std::cout << sum << '\n';
}
