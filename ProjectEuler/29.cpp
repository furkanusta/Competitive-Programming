/*
 * Projet Euler
 * Title: Distinct Powers
 * URL: https://projecteuler.net/problem=29
 * Author: Furkan Usta
 * Mon Jun 15 20:46:23 2015

 I was skeptic about the limits of 'double' but it worked.
 I think I should trust std::numeric_limits

 Using set incerases the speed very much
*/

#include <iostream>
#include <cmath>
#include <set>
using std::cout;
using std::endl;
using std::set;
set<double> s;
int main(int argc, char *argv[])
{
    
    for (int i = 2; i <= 100; i++)
        for (int j = 2; j <= 100; j++)
            s.insert(pow(i,j));
    cout << s.size() << endl;
    return 0;
}
