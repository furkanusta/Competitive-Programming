/*
 * Projet Euler
 * Title: Coin sums
 * URL: https://projecteuler.net/problem=31
 * Author: Furkan Usta
 * Tue Jun 16 23:40:46 2015
 This can also be done with brute-force using 8 loops but this is tidier.
 Check wiki for detailed explanation (https://en.wikipedia.org/wiki/Knapsack_problem)[Knapsack]
 
 */

#include <iostream>
using std::cout;
using std::endl;

int main(int argc, char *argv[])
{
    int arr[205];
    int coins[] = {1, 2, 5, 10, 20, 50, 100, 200};
    for (int i = 0; i <= 200; i++)
        arr[i] = 0;
    arr[0] = 1;
    for (int i = 0; i < 8; i++)
        for (int j = 0; j <= 200 - coins[i]; j++)
            if (arr[j])
                arr[j + coins[i]] += arr[j];
    cout << arr[200] << endl;
    return 0;
} // Answer: 73682

