/*
 * Given two strings write a function to determine if one string is a permutation of the other
 */
#include <string>
#include <map>
#include <cassert>

bool is_perm(std::string, std::string);
int main() {
    assert(is_perm("12345", "54321"));
    assert(is_perm("12345", "53124"));
    assert(is_perm("1", "1"));
    assert(is_perm("1", "2") == false);
    assert(is_perm("1", "11231232") == false);
    assert(is_perm("1111", "1") == false);
    assert(is_perm("1111", "12") == false);
}

// O(N) time, O(N) space in map
bool is_perm(std::string s1, std::string s2) {

    if (s1.length() != s2.length())
        return false;
    std::map<char,int> m; // Instead of map, arr[255] can be used  (if it is only ASCII)
    size_t length = s1.length();
    for (size_t i = 0; i < length; i++) {
        if (m.find(s1[i]) == m.end()) {
            m[s1[i]] = 1;
        }
        else {
            m[s1[i]]++;
        }
    }
    for (size_t i = 0; i < length; i++) {
        if (m.find(s2[i]) == m.end()) {
            m[s1[i]] = -1;
        }
        else {
            m[s2[i]]--;
        }
    }
    for(auto& i : m) {
        if (i.second != 0)
            return false;
    }
    return true;
}
