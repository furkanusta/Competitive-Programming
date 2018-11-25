#include <iostream>
#include <string_view>
#include <cassert>

#include <range/v3/all.hpp>
namespace view = ranges::view;

int main(int argc, char**argv) {
    assert(argc == 2);
    std::string_view str(argv[1]);
    auto filtered = str
        | view::transform([](char c){ return c - '0';})
        | view::adjacent_remove_if(ranges::not_equal_to());
    // adjacent_remove_if always includes last element, it is extra if the cycle doesn't connect
    int init = str.front() == str.back() ? 0 : '0' - str.back();
    std::cout << ranges::accumulate(filtered, init) << '\n';
}
