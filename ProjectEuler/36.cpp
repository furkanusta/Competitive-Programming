/*
 * Projet Euler
 * Title: Double-base Palindromes
 * URL: https://projecteuler.net/problem=36
 * Author: Furkan Usta
 * Fri Jun 19 00:48:21 2015
 */

#include <iostream>
using std::cout;
using std::endl;

int isPal(int i)
{
    int arr[10];
    int bin[100];
    int x = i, y = i;
    int countX = 0, countY = 0;
    while (x > 0) {
        arr[countX++] = x % 10;
        x /= 10;
    }
    while (y > 0) {
        bin[countY++] = y % 2;
        y /= 2;
    }
    for (int j = 0; j <= countX / 2; j++)
        if (arr[j] != arr[countX - j - 1])
            return false;
    for (int j = 0; j <= countY / 2; j++)
        if (bin[j] != bin[countY - j - 1])
            return false;
    return true;
}

int main()
{
    int ans = 0;
    for (int i = 1; i < 1000000; i++)
        if (isPal(i))
            ans += i;
    cout << ans << endl;
} // Answer: 872187
