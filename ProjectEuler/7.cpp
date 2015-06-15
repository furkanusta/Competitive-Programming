/*
 * Projet Euler
 * Title: 10001st Prime
 * URL: https://projecteuler.net/problem=7
 * Author: Furkan Usta
 * Sat Jun 13 12:15:00 2015
 */
#include <iostream>
#include <vector>

using std::vector;
using std::cout;
using std::endl;

int main(int argc, char *argv[])
{
    vector<long long int> prime;
    prime.push_back(2);
    bool isPrime = true;
    for (long long int i = 3; prime.size() < 10001; i+=2) {
        isPrime = true;
        for(auto j : prime)
            if (i % j == 0) {
                isPrime = false;
                break;
            }
        if (isPrime)
            prime.push_back(i);
    }
    cout << prime.back() << endl;
    return 0;    
} // Answer: 104743

