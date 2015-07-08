/*
 * Projet Euler
 * Title: Consecutive Prime Sum
 * URL: https://projecteuler.net/problem=50
 * Author: Furkan Usta
 * Sat Jun 20 00:50:45 2015
 */

#include <iostream>
#include <vector>
#include <algorithm>
using std::vector;
using std::cout;
using std::endl;
const int MAXN = 1000001;
vector<int> p;
int prime[MAXN + 5];
int sum[MAXN + 5];
void findPrimes()
{
    prime[1] = 1;
    prime[0] = 1;
    for (int i = 2; i < MAXN; i++)
        if (!prime[i])
            for (int j = i + i; j < MAXN; j += i)
                prime[j] = 1;
    for (int i = 2; i < MAXN; i++)
        if (!prime[i])
            p.push_back(i);
}

int main(int argc, char *argv[])
{
    int ans = 0, max = 0;
    findPrimes();
    int size = p.size();
    for (int i = 0; i < size; i++) {
        sum[i + 1] = sum[i] + p[i];
    }
    for (int i = 0; i < size; i++) {
        for (int j = i; j < size; j++) {
            if (sum[j] - sum[i] > MAXN)
                break;
            if (!prime[sum[j] - sum[i]] && j - i > max) {
                max = j - i;
                ans = sum[j] - sum[i];
            }
        }
    }
    cout << max << endl << ans << endl;
    return 0;
}
// Answer: 997651
