/*
 * Projet Euler
 * Title: Largest palindrome product
 * URL: https://projecteuler.net/problem=4
 * Author: Furkan Usta
 * Sat Jun 13 02:03:06 2015
*/
#include <iostream>
#include <string>
#include <algorithm>
using std::cout;
using std::endl;
using std::string;

bool isPalindrome(int n)
{
    string str = std::to_string(n);
    string str2 = str;
    std::reverse(str.begin(),str.end());
    if (str2 == str)
        return true;
    return false;
}


int main(int argc, char *argv[])
{
    int max = 0;
    for(int i = 999; i > 99; i--)
        for (int j = 999; j > 99; j--)
            if (isPalindrome(i*j)) {
                max = std::max(max,i*j);
            }
    cout << max << endl;
    return 0;
} // Answer: 906609

