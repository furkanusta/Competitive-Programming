/*
 * Projet Euler
 * Title: Even Fibonacci numbers
 * URL: https://projecteuler.net/problem=2
 * Author: Furkan Usta
 * Sat Jun 13 00:27:38 2015
*/
#include <iostream>
using std::cout;
using std::endl;
int main()
{
    int pre = 1, cur = 2;
    int sum = 0;
    
    while (cur < 4000001) {
        if (cur % 2 == 0)
            sum += cur;
        cur += pre;
        pre = cur - pre;
    }
    cout << sum << endl;
} // Answer: 4613732
