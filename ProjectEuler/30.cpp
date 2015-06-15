/*
 * Projet Euler
 * Title: Digit Fifth Power
 * URL: https://projecteuler.net/problem=30
 * Author: Furkan Usta
 * Mon Jun 15 20:48:09 2015

 Brute Force, ftw

 It could be faster with dividing digits into separate for loops instead of separating digits
*/
#include <iostream>
#include <cmath>
using std::cout;
using std::endl;

int main(int argc, char *argv[])
{
    int ans = 0;
    for (int i = 2, p = 0, temp = 0; i < 1000000; i++, p = 0) {
        temp = i;
        while(temp) {
            p += (int) pow(temp % 10, 5);
            temp /= 10;
        }
        if (p == i) {
            ans += i;
            cout << i << endl;
        }
    }
    cout << ans << endl;
    return 0;
} // Answer: 443839
