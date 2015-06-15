/*
 * Projet Euler
 * Title: 1000-digit Fibonacci Number
 * URL: https://projecteuler.net/problem=25
 * Author: Furkan Usta
 * Sun Jun 14 00:34:37 2015

 Tomorrow, I will dig up other libraries to use instead of gmp because
 I think it lacks lots of basic stuff, or since they are too basic
 they didn't put it in the documentation.
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
    mpz_t a;
    mpz_t b;
    mpz_class cpp(a);
    mpz_class cpp2(b);
    string str;
    mpz_init_set_si(a,1);
    mpz_init_set_si(b,1);

    for (int i = 2;;i++) {
        mpz_add(a,a,b);
        mpz_swap(a,b);
        cpp = mpz_class(a);	//Couldn't find a method like count_digit
        str = cpp.get_str();	//in C-interface so, I come up with this solution
        if (str.length() >= 1000) {
            cout << i << endl;
            break;
        }
    }
    return 0;
} // Answer: 4782
