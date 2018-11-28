#include <iostream>
#include <string>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;

int main() {
    auto rng = view::transform(
        ranges::getlines(std::cin),
        [](auto&&line){
            std::vector<int> vec = view::split(line, ' ')
                | view::transform([](auto&&x){ return std::string(x); })
                | view::transform([](auto&&x){ return std::stoi(x); });
            auto div = view::cartesian_product(vec, vec)
                | view::filter([](auto&&t){ return std::get<0>(t) != std::get<1>(t); })
                | view::filter([](auto&&t){ return std::get<0>(t) % std::get<1>(t) == 0; })
                | view::transform([](auto&&t){ return std::get<0>(t) / std::get<1>(t); });
            return div.front();
        });
    auto sum = ranges::accumulate(rng, 0);
    std::cout << sum << '\n';
}
