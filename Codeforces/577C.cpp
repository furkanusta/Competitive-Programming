/*
 * Codeforces
 * Title: Multiplication Table
 * URL  : http://codeforces.com/problemset/problem/577/A
 */
#include <iostream>
#include <vector>
using namespace std;

int main(int argc, char *argv[])
{
    int n, ans = 0, x, count;
    int arr[1050];
    vector<int> sol;
    cin >> n;
    for (int i = 0; i < 1050; i++)
        arr[i] = 0;
    for (int i = 2; i <= n; i++) {
        x = i;
        for (int j = 2; j <= x; j++) {
            count = 0;
            while (x % j == 0) {
                count++;
                x /= j;
            }
            if (arr[j] < count) {
                ans += count - arr[j];
                arr[j] = count;
            }
        }
    }
    cout << ans << endl;
    for (int i = 2; i <= n; i++) {
        x = 1;
        while (arr[i]) {
            x *= i;
            arr[i]--;
            cout << x << " ";
        }
    }
}
