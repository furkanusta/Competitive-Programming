/*
 * Projet Euler
 * Title: Names Scores
 * URL: https://projecteuler.net/problem=22
 * Author: Furkan Usta
 * Sat Jun 13 23:09:18 2015
 */

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

int main(int argc, char *argv[])
{
    ifstream in("p022_names.txt");
    string str;
    long long int ans = 0, ccc = 0;
    vector<string> v;
    while (getline(in, str, ','))
        v.push_back(str);
    sort(v.begin(), v.end());
    for (int i = 0; i < (int)v.size(); i++, ccc = 0) {
        for (int j = 1; j < (int)v[i].length() - 1; j++) 
            ccc += v[i][j] - 'A' + 1;
        ans += ccc*(i+1);
    }
    cout << ans << endl;
    return 0;
} // Answer: 871198282

