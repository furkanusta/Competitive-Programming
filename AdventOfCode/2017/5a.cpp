#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;


// TODO: Solution with ranges
int main() {
    std::vector<int> vec = ranges::getlines(std::cin)
        | view::transform([](auto&&x){ return std::stoi(x); });

    int count = 0;
    for (int i = 0, size = vec.size(); i >= 0 && i < size; i += vec[i] - 1, count++) {
        vec[i]++;
    }
    std::cout << count << "\n";
}
