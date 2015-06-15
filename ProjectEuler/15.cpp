/*
 * Projet Euler
 * Title: Lattice Paths
 * URL: https://projecteuler.net/problem=15
 * Author: Furkan Usta
 * Sat Jun 13 16:18:26 2015
 */

#include <iostream>
using std::cout;
using std::endl;

// Answer is basically C(2N,N)
// I will use pascal triangle instead of just multiplying
// because it may cause an integer overflow;

int main(int argc, char *argv[])
{
    const int N = 20;
    long long int pascal[2*N+1][2*N+1];

    for (int i = 1; i <= 2*N; i++) {
        pascal[i][0] = 1;
        pascal[i][i] = 1;
    }

    for (int i = 2; i <= 2*N; i++)
        for (int j = 1; j <= i; j++)
            pascal[i][j] = pascal[i-1][j] + pascal[i-1][j-1];
    cout << pascal[2*N][N] << endl;
    return 0;
} // Answer: 137846528820
