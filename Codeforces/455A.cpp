/*
 * Codeforces
 * Title: Boredom
 * URL  : http://codeforces.com/problemset/problem/455/A
 */
#include <iostream>
#include <algorithm>
using namespace std;

long long int n, x;
long long int arr[100050];
long long int cnt[100050];
int main() {
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> x;
        cnt[x]++;
    }
    arr[1] = cnt[1];

    for (long long int i = 2; i <= 100002; i++) {
        arr[i] = max(arr[i - 1], arr[i - 2] + cnt[i] * i);
    }
    cout << arr[100002];
}
