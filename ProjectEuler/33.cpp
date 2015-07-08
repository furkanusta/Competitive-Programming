/*
 * Projet Euler
 * Title: Digit cancelling fractions
 * URL: https://projecteuler.net/problem=33
 * Author: Furkan Usta
 * Wed Jun 17 00:48:31 2015
 */

#include <iostream>
using std::cout;
using std::endl;

int gcd(int a, int b)
{
    if ( b == 0)
        return a;
    return gcd(b, a%b);
}

int main(int argc, char *argv[])
{
    int denP = 1;
    int nomP = 1;
    for (int i = 1; i < 10; i++)
        for (int den = 1; den < i; den++) 
            for (int nom = 1; nom < den; nom++)
                if ((nom * 10 + i) * den == nom * (i * 10 + den)) {
                    denP *= den;
                    nomP *= nom;
                }
    
    cout << denP/gcd(denP, nomP) << endl;
    return 0;
}
// Answer: 100
