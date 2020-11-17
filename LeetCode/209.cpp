#include <string>
#include <vector>
#include <iostream>
#include <cstdio>

int minSubArrayLen(int s, const std::vector<int>& vec) {
    if (vec.size() == 0)
        return 0;
    int N = vec.size();
    int last = 0;
    int sum = 0;
    int ans = 2147483647;
    for (int i = 0; i < N; i++) {
        sum += vec[i];
        while (sum >= s) {
            ans = std::min(ans, i - last + 1);
            sum -= vec[last];
            last++;
        }
    }
    return (ans == 2147483647) ? 0 : ans;
}

int main() {
    std::vector<int> vec = {2,3,1,2,4,3};
    std::cout << minSubArrayLen(7, vec) << "\n";
}
