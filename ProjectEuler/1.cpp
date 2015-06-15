/*
 * Projet Euler
 * Title: Multiples of 3 and 5
 * URL: https://projecteuler.net/problem=1
 * Author: Furkan Usta
 * Sat Jun 13 00:10:50 2015
*/
#include <iostream>
using std::cout;

int main()
{
    int sum = 0;

    for (int i = 0; i < 1000; i++)
        if (i%3==0 || i%5==0)
            sum += i;
    cout << sum;
} // Answer: 233168

