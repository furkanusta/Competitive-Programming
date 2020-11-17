#include <string>
#include <iostream>
#include <cstdio>

bool checkInclusion(const std::string& s1, const std::string& s2) {
    if (s2.length() < s1.length())
        return false;
    int mark[26];
    int ans[26];
    for (int i = 0; i < 26; i++) {
        mark[i] = 0;
        ans[i] = 0;
    }
    for (int i = 0; i < s1.length(); i++) {
        ans[s1[i] - 'a']++;
    }
    int last = 0;
    while(last < s2.length() && !ans[s2[last] - 'a']) {
        ++last;
    }
    if (last < s2.length()) {
        mark[s2[last] - 'a']++;
    }
    bool same = true;
    for (int j = 0; j < 26; j++) {
        if (mark[j] != ans[j]) {
            same = false;
            break;
        }
    }
    if (same) {
        return true;
    }
    for (int i = last + 1; i < s2.length(); i++) {
        int num = s2[i] - 'a';
        // printf("%d %c %d %d\n", i, s2[i], ans[num], last);
        if (ans[num] == 0) {
            for (int j = last; j < i; j++) {
                mark[s2[j] - 'a']--;
            }
            last = i + 1;
            continue;
        }
        mark[num]++;
        if (i - last == s1.length()) {
            mark[s2[last] - 'a']--;
            last++;
        }
        bool same = true;
        for (int j = 0; j < 26; j++) {
            if (mark[j] != ans[j]) {
                // printf("False: %c %d %d\n", (j + 'a'), mark[j], ans[j]);
                same = false;
                break;
            }
        }
        if (same) {
            return true;
        }
    }
    return false;
}

int main() {
    std::string s1 =  "ky";
    // std::string s2 =  "eidbaooo";
    std::string s2 =  "ainwkckifykxlribaypk";
    std::cout << checkInclusion(s1, s2) << "--\n";
}
