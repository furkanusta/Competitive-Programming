/*
 * Given a string compress the characters in it.
 * Example : "aabbcccd" -> "a2b2c3d1"
 * If the compressed string is not smaller than the original return the original
 */
#include <string>
#include <iostream>
#include <sstream>

std::string compress(std::string);

int main() {

    std::cout << compress("aabbcccd") << std::endl;
    std::cout << compress("abcd") << std::endl;
    std::cout << compress("aaabbbcccddd") << std::endl;
    std::cout << compress("aaaa") << std::endl;
    std::cout << compress("a") << std::endl;
}

// O(N) time, O(N) extra memory
std::string compress(std::string s) {

    std::ostringstream t; // to append int (alternatively std::to_string can be used [C++11])
    size_t len = s.length();
    int count = 1;
    for (size_t i = 1; i < len; i++) {
        if (s[i] != s[i - 1]) {
            t << s[i - 1] << count;
            count = 1;
        }
        else
            count++;
    }
    t << s[len - 1] << count;
    std::string str = t.str();
    if (str.length() >= len)
        return s;
    return str;
}
