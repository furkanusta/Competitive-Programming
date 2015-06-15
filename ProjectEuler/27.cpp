/*
 * Projet Euler
 * Title: Quadratic Primes
 * URL: https://projecteuler.net/problem=27
 * Author: Furkan Usta
 * Mon Jun 15 19:30:10 2015

 Since |a|<1000 and |b|<1000, There is at most 4million possible solutions and it can be done via bruteforce, however I will try to limit possibilities.
 First of all I got help from this site:  http://www.mathblog.dk/project-euler-27-quadratic-formula-primes-consecutive-values/
 Thanks to Kristian for his contribution

 n^2+a*n+b = must be prime
 For n = 0, it yields b; so b must be prime.
 For n = 1, it yields 1+a+b which is also a prime.
     Therefore 1+a+b > 1 ==> a+b > 0 ==> a > -b and since b is prime that shows a < 0 and |a| < b;
     Also from n = 1, we can obtain a must be odd unless b = 2, and a must be even if b = 2. However since |a| < b, b cannot be 2.
     
  Finally, we have a prime b > 2 and negative a whose absolute value is
  less than b.
*/

#include <iostream>
#include <vector>
#include <algorithm>
using std::binary_search;
using std::vector;
using std::cout;
using std::endl;
vector<int> p;

bool isPrime(int x)
{
    for (int i = 3; i * i <= x; i+=2)
        if (x % i == 0)
            return false;
    return true;
}

int main(int argc, char *argv[])
{
    int n = 0, max = 0;
    int ans = 0;
    p.push_back(2);
    for (int i = 3; i < 1000; i++)
        if (isPrime(i)) {
            p.push_back(i);
        }
    for (size_t i = 0; i < p.size(); i++)
        for (int a = -1; a > -p[i]; a -= 2) {
            n = 0;
            while (binary_search(p.begin(), p.end(),
                                 n*n + a * n + p[i]))
                n++;
            if (n > max) {
                max = n;
                ans = a * p[i];
            }
        }
    cout << ans << endl;
    return 0;
} // Answer: -59231
