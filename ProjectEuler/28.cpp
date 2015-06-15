/*
 * Projet Euler
 * Title: Number Spiral Diagonals
 * URL: https://projecteuler.net/problem=28
 * Author: Furkan Usta
 * Mon Jun 15 20:15:49 2015

 Formula that I've found is 16n^2-28n+16 (It doesn't hold for n = 1, so I will add it separately)

 I've found that upper right corner is square of the 2*n-1, added it 4 times then subtracted to excess.
*/

#include <iostream>
using std::cout;
using std::endl;
int main(int argc, char *argv[])
{
    long long int sum = 1;
    for (int i = 2; i <= 501; i++)
        sum += 16*i*i - 28 * i + 16 ;

    cout << sum << endl;
    return 0;
} // Answer: 669171001

