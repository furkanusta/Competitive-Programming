#include <vector>
#include <algorithm>
#include <iostream>
#include <cstdio>

int longestMountain(const std::vector<int>& vec) {
    if (vec.size() < 3 ) {
        return 0;
    }
    int start = vec[0];
    int N = vec.size();
    int last = 0;
    int direction = 0;
    int ans = 0;
    for (int i = 1; i < N; i++) {
        // printf("%d %d %d %d\n", i, direction, last, vec[i]);
        if (direction == 0) {
            if (vec[i] > vec[i - 1]) {
                direction = 1;
            } else {
                last = i;
            }
        } else if (direction == 1) {
            if (vec[i] == vec[i - 1]) {
                last = i;
                direction = 0;
            } else if (vec[i] < vec[i - 1]) {
                direction = -1;
            }
        } else {
            if (vec[i] == vec[i - 1]) {
                direction = 0;
                ans = std::max(ans, i - last);
                last = i;
            } else if (vec[i] > vec[i - 1]) {
                direction = 1;
                ans = std::max(ans, i - last);
                last = i - 1;
            }
        }
    }
    if (direction == -1) {
        // printf("%d %d %d\n", ans, direction, last);
        ans = std::max(ans, N - last);
    }
    return ans >= 3 ? ans : 0;
}

int main() {
    std::vector<int> vec = {2,1,4,7,3,2,5};
    // std::vector<int> vec = {875,884,239,731,723,685};
    std::cout << longestMountain(vec) << "\n";
}
