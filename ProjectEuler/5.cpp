/*
 * Projet Euler
 * Title: Smallest Multipl
 * URL: https://projecteuler.net/problem=5
 * Author: Furkan Usta
 * Sat Jun 13 02:23:27 2015
*/
#include <iostream>
using std::cout;
using std::endl;

int main(int argc, char *argv[])
{
    int N = 20;
    long long int ans = N;
    bool found = false;
    
    while(!found) {
        found = true;
        for (int i = 1; i <= N; i++)
            if (ans % i != 0) {
                found = false;
                break;
            }
        ans += N;
    }
    cout << ans-N << endl;
    return 0;
} // Answer: 232792560
