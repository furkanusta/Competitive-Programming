/*
 * Implement an algorithm to determine if a string has all unique characters.
 * What if you cannot use additional data structures?
 */
#include <string>
#include <cassert>
bool is_unique(std::string);
bool unique2(std::string);


int main() {

    assert(is_unique("asdfghj"));
    assert(unique2("asdfghj"));
    assert(is_unique("abcdefgHIJKLMnoprSTUWXYZ"));
    assert(unique2("abcdefgHIJKLMnoprSTUWXYZ"));
    assert(unique2("aabc") == false);
    assert(unique2("zasdbvcdfgrz") == false);
    assert(unique2("qasdbvcdfgzz") == false);
    assert(is_unique("qasdbvcdfgzz") == false);
}

// O(1) memory O(N) time
bool is_unique(std::string s) {

    int arr[30];
    for (int i = 0; i < 30; i++)
        arr[i] = 0;
    size_t len = s.length();
    int c;
    for (size_t i = 0; i < len; i++) {
        c = std::toupper(s[i]) - 'A';
        if (arr[c])
            return false;
        arr[c]++;
    }
    return true;
}

// If extra memory is forbidden complexity is O(N^2)
bool unique2(std::string s) {

    size_t len = s.length();

    for (size_t i = 0; i < len; i++)
        for (size_t j = i + 1; j < len; j++)
            if (s[i] == s[j])
                return false;
    return true;
}
