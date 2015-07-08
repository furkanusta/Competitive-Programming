/*
 * Projet Euler
 * Title: Square Root Convergents
 * URL: https://projecteuler.net/problem=57
 * Author: Furkan Usta
 * Tue Jun 30 22:22:17 2015
 *
 * Perl's bigint library was really poor, so I decided to use
 * GMP library
 */
#include <iostream>
#include <gmp.h>

using std::cout;
using std::endl;

int digit(mpz_t &ccc) {
    mpz_t t;
    mpz_init_set(t, ccc);
    int count = 0;
    // mpz_out_str(stdout, 10, t);
    // cout << "\n";
    while (mpz_cmp_ui(t, 0)) {
        count++;
        mpz_fdiv_q_ui(t, t, 10);
    }
    return count;
}

int main(int argc, char *argv[])
{
    mpz_t num;
    mpz_t den;
    mpz_t temp;
    int ans = 0;
    mpz_init_set_ui(num, 3);
    mpz_init_set_ui(den, 2);
    mpz_init_set_ui(temp,2);
    // cout << "\n";
    for (int i = 1; i < 1000; i++) {
        mpz_addmul(num, temp, den);
        mpz_sub(den, num, den);
        // mpz_out_str(stdout, 10, den);
        // cout << digit(num) << " " << digit(den) << endl;
        if (digit(num) > digit(den)) {
            ans++;
        }
    }
    cout << ans << endl;
    return 0;
}
// Answer: 153
