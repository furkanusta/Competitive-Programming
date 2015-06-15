/*
 * Projet Euler
 * Title: Number Letter Counts
 * URL: https:              //projecteuler.net/problem=17
 * Author: Furkan Usta
 * Sat Jun 13 20:01:30 2015
 */

#include <iostream>
using std::cout;
using std::endl;
                            // zero, one, two, three, four, five, six, seven, eight, nine
int digits[10] = {0, 3, 3, 5, 4, 4, 3, 5, 5, 4};
                            //ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
int after[] ={3, 6, 6, 8, 8, 7, 7, 9, 8, 8};
                            //twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety
int extras[120]  = {0, 0, 6, 6, 5, 5, 5, 7, 6, 6};
int and_ = 3;

int count(int i)
{
    int ret = 0;
    if (i == 1000)
        return 11;
    if (i >= 100) {
        ret += digits[i/100];
        ret += 7;           // "hundred"
        if (i != 100)
            ret += and_;
    }
    if (i%100 >= 20) {      //i>=20
        ret += extras[i/10%10];
        ret += digits[i % 10];
    }
    else if (i%100 >= 10) { //20>i>=10
        ret += after[i % 10];
    }
    else                    // 10>i
        ret += digits[i % 10];
    cout << ret << endl;
    return ret;
}

int main(int argc, char *argv[])
{
    int ans = 0;
    for (int i = 1; i <= 1000; i++)
        ans += count(i);
    cout << ans << endl;
    return 0;
}
/***
 Instead of counting letters with iterating
 little math-trick can solve the question very easily.

 Answer can be found by solving little parts and summing them.
 1-9, 10-19, 20-99, 100-999, 1000

 ***/
