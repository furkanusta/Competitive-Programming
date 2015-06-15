/*
 * Projet Euler
 * Title: Lexicographic Permutations
 * URL: https://projecteuler.net/problem=24
 * Author: Furkan Usta
 * Sun Jun 14 00:29:12 2015

 Again, it can be solved by pen without any code but this one is not
 that long.
 */

#include <iostream>
#include <algorithm>
using std::cout;
using std::endl;
int main(int argc, char *argv[])
{
    int arr[] = {0,1,2,3,4,5,6,7,8,9};

    for (int i = 0; i <= 1000000; i++)
        std::next_permutation(arr, arr + 10);
    for (int i = 0; i < 10; i++)
        cout << arr[i];
    cout << endl;
    return 0;
} // Answer: 2783915640

