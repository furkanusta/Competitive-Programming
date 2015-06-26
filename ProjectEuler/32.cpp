/*
 * Projet Euler
 * Title: Pandigital Products
 * URL: https://projecteuler.net/problem=32
 * Author: Furkan Usta
 * Wed Jun 17 00:06:37 2015
 That is a really nice question. Credit for the pandigital check goes to Andras from http://stackoverflow.com/a/2485016

 Instead of storing in the array it uses bits and shifting to check.
 It might be better to explain it on an example. For exmaple our number is 2132; initially mark equals to 0 but I will use it in binary form 0000
 We will iterate all digits in 2132 from right to left
 digit | mark
 2     | 0010
 3     | 0110
 1     | 0111
 2     | 0111  // It is same as the previous one which means this number is repeating

 After this point we can use brute-force but it is better to limit the boundaries
 To use 9 digits we have to multiply  a 4-digit with a 1-digit or
 a 2-digit to 3-digit
 */

#include <iostream>
#include <bitset>
using std::bitset;
using std::cout;
using std::endl;

bool isPan(int k)
{
    long temp = 0, mark = 0, count = 0;
    while (k > 0) {
        mark |= 1 << (k % 10 - 1);
        if (temp == mark)
            return false;
        k /= 10;
        count++;
        temp = mark;
    }
    return temp == ((1 << count) - 1);
}

long concat(long a, long b) { // To get multiplicand, multiplier and product together
    long c = b;
    while (c > 0) {
        a *= 10;
        c /= 10;
    }
    return a + b;
}

int main(int argc, char *argv[])
{
    long begin, end;
    long product;
    long sum = 0;
    long ccc = 0;
    int arr[10500];
    for (int i = 0; i < 10500; i++)
        arr[i] = 0;
    for (int i = 2; i < 100; i++) {
        begin = (i < 10) ? 1234 : 123;
        end   = 10000 / i;
        for (int j = begin; j <= end; j++) {
            product = i * j;
            ccc = concat(concat(i, j), product);
            if (ccc >= 1e8 && ccc < 1e9 && isPan(ccc) && !arr[product]) {
                sum += product;
                arr[product] = 1;
            }
        }
    }
    cout << sum << endl;
    return 0;
} // Answer: 45228
