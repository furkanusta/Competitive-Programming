/*
 * Title: Appleman and Toastmen
 * URL  : Projects/Competitive/Codeforces/461/A
 *
 * My perl code couldn't pass the time limit.
*/
#include <iostream>
#include <vector>
#include <algorithm>
using std::cin;
using std::cout;
using std::endl;
using std::vector;
int main() {
    long long n, x, ans = 0;
    long long arr[300005];

    cin >> n;

    for (int i = 0; i < n; i++) {
        cin >> x;
        arr[i] = x;
    }
    std::sort(arr, arr + n);

    for (int i = 0; i < n - 1; i++) {
        ans += (i + 2) * arr[i];
    }
    ans += n * arr[n - 1];
    cout << ans;
}
