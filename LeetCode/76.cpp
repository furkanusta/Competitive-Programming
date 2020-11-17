#include <string>
#include <iostream>
#include <cstdio>
#include <vector>

std::string minWindow(std::string s, std::string t) {
    std::vector<int> mark(255, 0);
    std::vector<int> target(255, 0);
    int N = s.length();
    int M = t.length();
    for (int i = 0; i < M; i++) {
        target[t[i]]++;
    }
    int last = 0;
    std::string ans = "";
    for (int i = 0; i < N; i++) {
        int num = s[i];
        mark[num]++;
        while (last < N && (mark[s[last]] > target[s[last]])) {
            mark[s[last]]--;
            ++last;
        }
        auto length = i - last + 1;
        bool same = true;
        for (int j = 0; j < 255; j++) {
            if (mark[j] < target[j]) {
                same = false;
            }
        }
        if (same && (length < ans.length() || ans.length() == 0)) {
            ans = s.substr(last, length);
        }
    }
    return ans;
}

int main() {
    std::string s1 = "a";
    std::string s2 = "aa";
    std::cout << minWindow(s1, s2) << "\n";
}
