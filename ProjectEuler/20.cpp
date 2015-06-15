/*
 * Projet Euler
 * Title: Factorial Digit Sum
 * URL: https://projecteuler.net/problem=20
 * Author: Furkan Usta
 * Sat Jun 13 21:57:05 2015
 */

#include <iostream>
#include <gmp.h>
#include <gmpxx.h>
#include <string>
using std::string;
using std::cout;
using std::endl;
int main(int argc, char *argv[])
{
    mpz_t fact;
    mpz_init(fact);
    mpz_fac_ui(fact,100);
    mpz_class factpp(fact);
    string str = factpp.get_str();
    long long int ans = 0;
    for (int i = 0; i < (int)str.length(); i++)
        ans += str[i] - '0';
    cout << ans << endl;
    return 0;
} // Answer: 648

/**
 mpz_t converted to mpz_class (C++ type) because I didn't like gmp
 interface and I want to use strings, and C++ interface provides
 almost nothing.
 **/
