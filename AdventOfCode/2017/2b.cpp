#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;

// Making getline a range could enable us to use more range
int main() {
    std::string line;
    int sum = 0;
    while(std::getline(std::cin, line)) {
        auto vec = action::split(line, '\t');
        auto ints = view::transform(vec, [](auto&&x){
                                             return std::stoi(std::string(x.begin(), x.end()));
                                           });
        auto div = view::cartesian_product(ints, ints)
            | view::filter([](auto&&t){ return std::get<0>(t) != std::get<1>(t); })
            | view::filter([](auto&&t){ return std::get<0>(t) % std::get<1>(t) == 0; })
            | view::transform([](auto&&t){ return std::get<0>(t) / std::get<1>(t); });
        sum += ranges::accumulate(div, 0); // single element but still
    }
    std::cout << sum << '\n';
}
