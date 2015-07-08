/*
 * Projet Euler
 * Title: Integer right triangles
 * URL: https://projecteuler.net/problem=39
 * Author: Furkan Usta
 * Fri Jun 19 01:15:41 2015
 */

#include <iostream>
using std::cout;
using std::endl;

int main()
{
    int count = 0, max = 0, ans = 0;
    for (int p = 1000; p >= 1; p--) {
        count = 0;
        for (int i = 1; i < p; i++)
            for (int j = 1; j <= i; j++)
                if (i * i + j * j == (p - i - j) * (p - i - j) &&
                    i + j > (p - i - j) && (p - i -j) > i &&
                    (p - i - j) > j)
                    count++;
        if (count > max) {
            max = count;
            ans = p;
        }
    }
    cout << ans << endl;
}
// Answer: 840
