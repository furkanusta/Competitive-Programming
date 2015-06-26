/*
 * Projet Euler
 * Title: Circular Primes
 * URL: https://projecteuler.net/problem=35
 * Author: Furkan Usta
 * Wed Jun 17 01:00:23 2015
 */

#include <iostream>
using std::cout;
using std::endl;

bool prime[1000005];

void findPrimes()
{
    for (int i = 2; i < 1000000; i++)
        if (!prime[i])
            for (int j = i + i; j < 1000000; j += i)
                prime[j] = 1;
}

bool rotate(int i)
{
    int x = i;
    int temp = 0;
    int digit = 0;
    int arr[10];

    while (i > 0) {
        i /= 10;
        digit++;
    }
    for (int i = 0; i < digit; i++) {
        arr[digit - i - 1] = x % 10;
        x /= 10;
    }    
        
    for (int i = 0; i < digit; i++) {
        temp = arr[0];
        x = 0;
        for (int j = 0; j < digit - 1; j++)
            arr[j] = arr[j + 1];
        arr[digit - 1] = temp;
        for (int j = 0; j < digit; j++)
            x = x * 10 + arr[j];
        if (prime[x])
            return false;
    }
    return true;
}

int main(int argc, char *argv[])
{
    int ans = 0;
    findPrimes();
    for (int i = 2; i < 1000000; i++)
        if (!prime[i] && rotate(i))
            ans++;
    cout << ans << endl;
    return 0;
} // Annswer: 55

