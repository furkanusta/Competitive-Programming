/*
 * Projet Euler
 * Title: Special Pythagorean Triplet
 * URL: https://projecteuler.net/problem=9
 * Author: Furkan Usta
 * Sat Jun 13 13:42:32 2015
 */

#include <iostream>
using std::cout;
using std::endl;

int main(int argc, char *argv[])
{
    for (int a = 1; a < 1000; a++)
        for (int b = 1; b < 1000; b++)
            if (a+b>1000)
                break;
            else if (a*a + b*b == (1000-a-b)*(1000-a-b)) {
                cout << a*b*(1000-a-b) << endl;
                break;
            }
    return 0;
} // Answer: 31875000
