/*
 * Projet Euler
 * Title: Reciprocal Cycles
 * URL: https://projecteuler.net/problem=26
 * Author: Furkan Usta
 * Mon Jun 15 17:57:58 2015
 Credit for the code goes to zball from the discussion forum.
 Credit for the explanation of code goes to chatran22 again from the discussion forum. I am copying the explanation at the bottom of the code because euler forum does not show all the posts.

 The other solution would be applying a long division and storing remainders in an array, vector etc.
 then performing search everytime to findout if there is a repetition.
*/

#include <iostream>
using std::cout;
using std::endl;
#include <cstdio>
int n,v,x;

int calc(int v){
    if(v % 5 == 0 || v % 3 == 0)
        return 0;
    int r = 1, k = 1;
    while(k) {
        r++;
        k = (k * 10 + 1) % v;
    }
    return r;
}
int main()
{
    int n, ans = 0, max = 0;
    for(int i = 3; i < 1000; i+=2) {
        n = calc(i);
        if(n > max) {
            max = n;
            ans = i;
        }
    }
    printf("%d\n", ans);    
    return 0;
} // Answer: 983
/**
Following this reasoning, a periodic number is obtained as follows:
for example, if we get:

n=0,xyzabcdeabcdeabcde...
Where "xyz" is the non-periodic part and "abcde" is the periodic part.

we have:
n=(xyzabcde−xyz)99999000

n=(xyzabcde−abcde)9⋅(11111)⋅10^3
Note that for any periodics number sequence, the amount of 1 digits is equal to the amount of periodic digits (number of letters in "abcde..."). And the exponent of 10 is the number of digits that are not repeated (number of letters in "xyz...").

Then, continuing with the previous example and relating to the exercise 26:
1/d=n
thus:
9⋅(11111⋅10^3)/d="positive integer"

Then any of the numbers that concern us can be factored as:
3^2⋅(11111)⋅(2⋅5)k
So we see that we are only interested in primes. And, if we ignore the numbers of primes to 2,3 and 5 in the list, we can only find the number 1111... that is divisible by d.

which it is obtained from the recursive sequence:
n[0]=1
n[i]=10⋅n[i−1]+1

TL;DR
The number that divides the longest series of 1-digit is the number that has more periodic digits.

 **/
