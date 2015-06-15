/*
 * Projet Euler
 * Title: Longest Collatz Sequence
 * URL: https://projecteuler.net/problem=14
 * Author: Furkan Usta
 * Sat Jun 13 15:14:37 2015
 */

#include <iostream>
using std::cout;
using std::endl;
int main(int argc, char *argv[])
{
    long long int x;
    long long int count;
    long long int ans = 0, max = 0;
    for (long long int i = 1; i < 1000000; i++) {
        x = i;
        count = 0;
        while (x != 1) {
            if (x%2)
                x = 3*x + 1;
            else
                x/=2;
            count++;
        }
        if (count > max) {
            max = count;
            ans = i;
        }
    }
    cout << ans << endl;
    return 0;
} // Answer: 837799
