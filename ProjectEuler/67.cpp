/*
 * Projet Euler
 * Title: Maximum Path Sum II
 * URL: https://projecteuler.net/problem=67
 * Author: Furkan Usta
 * Sat Jun 13 20:59:54 2015

 Refer to problem 18 for explanation
 */

#include <iostream>
#include <fstream>
using std::cout;
using std::endl;
int main(int argc, char *argv[])
{
    int N = 99;
    int triangle[100][100];
    FILE *in = fopen("p067_triangle.txt","r");
    for (int i = 0; i <= N; i++)
        for (int j = 0; j <= i; j++) 
            fscanf(in, "%d", &triangle[i][j]);
    for (int i = N - 1; i >= 0; i--)
        for (int j = 0; j <= i; j++)
            triangle[i][j] += std::max(triangle[i+1][j],triangle[i+1][j+1]);
    cout << triangle[0][0] << endl;
    fclose(in);
    return 0;
} // Answer: 7273

