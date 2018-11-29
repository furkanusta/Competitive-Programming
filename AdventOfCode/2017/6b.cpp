#include <iostream>
#include <string>
#include <string_view>
#include <cassert>
#include <map>

#include <range/v3/all.hpp>
namespace view = ranges::view;
namespace action = ranges::action;


int main() {
    std::string line;
    std::getline(std::cin, line);
    std::vector<int> vec = view::split(line, '\t')
        | view::transform([](auto&&x){ return std::string(x); })
        | view::transform([](auto&&x){return std::stoi(x);});
    std::map<std::vector<int>, int> mark;
    int count = 0;
    while(mark.emplace(vec, count).second) {
        count++;
        auto it = ranges::max_element(vec);
        int val = *it;
        *it = 0;
        auto dist = ranges::distance(vec.begin(), it);
        ranges::for_each(view::cycle(vec) | view::drop(dist+1) | view::take_exactly(val),
                         [](auto&x){ x++; });
    }
    auto prev = mark.find(vec)->second;
    std::cout << (count - prev) << "\n";
}
