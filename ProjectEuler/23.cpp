/*
 * Projet Euler
 * Title: Non-abundant sums
 * URL: https://projecteuler.net/problem=23
 * Author: Furkan Usta
 * Sat Jun 13 23:28:16 2015
 My own solution was a bit long ~5 sec, so I've decided to put someone
 else's  solution credit goes to blazs from discussion thread.
*/
#include <stdio.h>
const int UPPER = 28123;
int abundant[UPPER];

int is_abundant(int n);
bool is_sum(int n);

int main(int argc, char **argv) {
    int sum = 0;

    for (int i = 0; i < UPPER; i++)
        abundant[i] = -1;
    for (int i = 1; i < UPPER; i++)
        if (!is_sum(i))
            sum += i;
    printf("%d\n", sum);
    return 0;
}

int is_abundant(int n) {
    int d,sum;
    if (abundant[n] != -1)
        return abundant[n];
    else  {
        sum = 1;
        for (d = 2; d*d < n; d++) 
            if (n%d == 0)
                sum += (d + n/d);    // This part really increases the speed
        if (d*d == n)
            sum += d;
        return abundant[n] = sum > n;
    }
}

bool is_sum(int n)
{
    for (int p = 1; p <= n/2; p++)
        if (is_abundant(p) && is_abundant(n-p))
            return true;
    return false;
}
