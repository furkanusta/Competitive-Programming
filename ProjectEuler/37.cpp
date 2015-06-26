/*
 * Projet Euler
 * Title: Truncatable Primes
 * URL: https://projecteuler.net/problem=37
 * Author: Furkan Usta
 * Fri Jun 19 01:04:45 2015
 */

#include <iostream>
using std::cout;
using std::endl;

bool prime[10000005];

void findPrimes()
{
    prime[1] = 1;
    prime[0] = 1;
    for (int i = 2; i < 10000000; i++)
        if (!prime[i])
            for (int j = i + i; j < 10000000; j += i)
                prime[j] = 1;
}

bool convert(int n)
{
    int d = 0;
    int arr[100];
    int x = 0;
    while (n > 0) {
        arr[d++] = n % 10;
        if (prime[n])
            return false;
        n /= 10;
    }
    for (int i = 0; i < d; i++) {
        x = 0;
        for (int j = i; j >= 0; j--)
            x = x * 10 + arr[j];
        // cout << x << " " << prime[x] << endl;
        if (prime[x])
            return false;
    }
    return true;
}

int main()
{
    int count = 0;
    int ans = 0;

    findPrimes();
    // cout << convert(3797) << endl;
    // return 0;
    for (int i = 10; count < 11; i++) {
        if (convert(i)) {
            ans += i;
            count++;
        }
    }
    cout << ans << endl;
}
