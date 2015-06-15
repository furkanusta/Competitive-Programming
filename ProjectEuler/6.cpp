/*
 * Projet Euler
 * Title: Sum Square Difference
 * URL: https://projecteuler.net/problem=6
 * Author: Furkan Usta
 * Sat Jun 13 02:34:48 2015
*/
#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
    int N = 100;
    int squareSum = N * (N+1) * (2*N+1) / 6;
    int sumSquare = N*(N+1)/2*N*(N+1)/2;

    cout << sumSquare - squareSum << endl;
    return 0;
} // Answer: 25164150
