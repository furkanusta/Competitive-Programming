#include <iostream>
#include <string_view>

#include <range/v3/all.hpp>
namespace view = ranges::view;

int main(int argc, char**argv) {
    assert(argc == 2);
    std::string_view str(argv[1]);
    auto filtered = view::zip(str, view::cycle(str) | view::drop(str.size() / 2))
        | view::filter([](auto&&t){ auto&&[l, r] = t; return l == r; })
        | view::transform([](auto&&t){ return std::get<0>(t); })
        | view::transform([](char c){ return c - '0';});
    std::cout << ranges::accumulate(filtered, 0) << '\n';
}
