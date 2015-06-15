/*
 * Projet Euler
 * Title: Amicable Numbers
 * URL: https://projecteuler.net/problem=21
 * Author: Furkan Usta
 * Sat Jun 13 23:09:18 2015
 */

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

int divisors(int x)
{
    int ccc = 0;
    for (int i = 1; i < x; i++)
        if (x % i == 0)
            ccc += i;
    return ccc;
}

int main(int argc, char *argv[])
{
    int ans = 0;
    for (int i = 1; i < 10000; i++)
        if (divisors(i) != i && divisors(divisors(i)) == i)
            ans += i;
    cout << ans << endl;
    return 0;
} // Answer: 31626
