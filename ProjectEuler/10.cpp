/*
 * Projet Euler
 * Title: Summation of Primes
 * URL: https://projecteuler.net/problem=10
 * Author: Furkan Usta
 * Sat Jun 13 13:45:35 2015
 */

#include <iostream>
#include <bitset>

using namespace std;

int main()
{
    bitset<2000000> Sieve;
    long long int sum = 0;
        
    Sieve.flip();      // Set all bits to 1
    Sieve[0].flip();   // Set 0 and 1 to not prime
    Sieve[1].flip();

    // Check all nos from 2 to 1 million
    for(long i = 2; i < 2000000; ++i)
    {
        if( ! Sieve[i] ) {
            continue;
        }
        else {
            sum += i;                                
            for(long j = 2*i; j < 2000000; j += i)
                Sieve[j] = 0;
        }
    }
    cout << sum << endl;
    return 0;
} // Answer: 142913828922
