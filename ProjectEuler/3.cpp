/*
 * Projet Euler
 * Title: Largest prime factor
 * URL: https://projecteuler.net/problem=3
 * Author: Furkan Usta
 * Sat Jun 13 00:37:20 2015
*/

#include <iostream>
#include <cmath>
using std::cout;
using std::endl;

long long int find(long long int n)
{
    int ans = 1;
    if (n%2 == 0)
        ans = 2;
    while (n%2==0)
        n/=2;
    int limit = sqrt(n);
    for (int i = 3; i <= limit; i+=2) {
        // cout << i << endl;
        if (n % i == 0)
            ans = i;
        while(n%i == 0)
            n /= i;
    }
    return ans;
}

int main()
{
    cout << find(600851475143) << endl;
} // Answer 6857

