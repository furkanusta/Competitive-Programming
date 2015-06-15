/*
 * Projet Euler
 * Title: Highly Divisible Triangular number
 * URL: https://projecteuler.net/problem=12
 * Author: Furkan Usta
 * Sat Jun 13 14:26:27 2015
 */

#include <iostream>
#include <cmath>

using std::cout;
using std::endl;

//  It is basically brute-force
int main(int argc, char *argv[])
{
    int ans = 0;
    int num = 0;
    int lim;
    int count = 1, exp;
    for (int i = 1; ; i++) { 	// For Triangle-numbers
        ans += i;
        num = ans;
        count = 1;
        lim = sqrt(num);
        while(num % 2 == 0) {
            num /= 2;
            exp++;  	//Count exponents
        }
        count *= (exp + 1);
        
        for (int j = 3; j <= lim; j+=2) {	// Look-up for divisors
            exp = 0;
            while (num % j == 0) {
                num /= j;
                exp++;
            }
            count *= (exp + 1);
        }
        if (count > 500) {
            cout << ans << endl;
            break;
        }
    }
    return 0;
} // Answer: 76576500
