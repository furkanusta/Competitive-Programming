/*
 * Write a function void reverse(char* str) in C/C++ which reverses a NULL terminated string
*/
#include <cassert>
#include <algorithm>
#include <iostream>

void reverse(char*);

int main() {
    char s[] = "abcdef";
    reverse(s);
    std::cout << s << std::endl;
    reverse(s);
    std::cout << s << std::endl;
}

void reverse(char *str) {

    int length = 0;
    for (int i = 0; str[i]; i++){
        length++;
    }
    for (int i = 0; i <= length / 2; i++) {
        std::swap(str[i], str[length - i - 1]); // 3-line swap can be written instead of std::swap
    }
}
