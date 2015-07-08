/*
 * Codeforces
 * Title: Ancient Berland Circus
 * URL  : http://codeforces.com/contest/1/problem/C
 *
 * I couldn't find my bug in Perl, so I've decided to implement in C++
 */
#include <iostream>
#include <math.h>
#include <cmath>
#include <stdio.h>
using namespace std;
double fgcd(double a, double b){  
    return (b < 1E-2) ? a : fgcd(b, fmod(a, b));  
}  

int main()
{
    double x[3], y[3], z[3], angle[3];
    for(int i = 0; i < 3; i++)
        cin >> x[i] >> y[i];
    for(int i = 0; i < 3; i++)
        z[i] = sqrt((x[i] - x[(i + 1) % 3]) * (x[i] - x[(i + 1) % 3]) + (y[i] - y[(i + 1) % 3]) * (y[i] - y[(i + 1) % 3]));
    double q = (z[0] + z[1] + z[2])/2;
    double S = sqrt(q * (q - z[0]) * (q - z[1]) * (q - z[2]));
    double r = (z[0] * z[1] * z[2])/(4 * S);
    for(int i = 0; i < 2; i++)
        angle[i] = acos(1 - z[i] * z[i]/(2 * r * r));
    angle[2] = 2 * acos(-1.0) - angle[0] - angle[1];
    double min = fgcd(angle[0], fgcd(angle[1], angle[2]));
    printf("%.6lf\n", r * r * sin(min) / 2 * (2 * acos(-1.0) / min));  
}
