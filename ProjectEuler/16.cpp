/*
 * Projet Euler
 * Title: Power Digit Sum
 * URL: https://projecteuler.net/problem=16
 * Author: Furkan Usta
 * Sat Jun 13 16:29:59 2015
 */

#include <iostream>
#include <gmpxx.h>
#include <cstring>
#include <string>
//using namespace mpz_class;
using std::cout;
using std::endl;
using std::string;
int main(int argc, char *argv[])
{
    const int N = 1001;
    long long int ans = 0;
    string str(N,'0');
    str[0] = '1';
    mpz_class product(str, 2);
    str = product.get_str();
    for (int i = 0; i < (int)str.length(); i++)
        ans += str[i] - '0';
    cout << ans << endl;
    return 0;
} // Answer: 1366

/***
 In this problem I have used GMP (GNU Multiple Precision) Library
 that can be installed from https://gmplib.org

 I've sent 2^1000 to mpz_class in string format stating that it is in
 base 2. Then I've convert it back in base 10.
 
 Other solution would be using an array for each digit and adding with
 itself instead of multiplying by 2.
 ***/
