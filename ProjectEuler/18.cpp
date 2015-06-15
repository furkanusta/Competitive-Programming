/*
 * Projet Euler
 * Title: Maximum Path Sum 1
 * URL: https://projecteuler.net/problem=18
 * Author: Furkan Usta
 * Sat Jun 13 20:59:54 2015

 In this answer we are moving from bottom-to-top by summing up
 Each cell in Line before the bottom has only two choices and maximum
 one will be more reasonable. Therefore, we can sum bottom two lines
 into one and repeat the process until reaching top.
 For example
	 1	>  1	> 8
	 2 3	>  3 5	>
	 0 1 2  >
  In first step we wrote 3 and 5 instead of 2 and, respectively because
  In 2 we have only 2 choices and 1 is bigger, and in 3 cell 2 has  a
  bigger value.

  I don't think I wrote an understandable explanation, but this solution works in Problem 67 as well, and I think it is not that hard to choose brute force instead of this.  
 */

#include <iostream>
using std::cout;
using std::endl;
int main(int argc, char *argv[])
{
    int N = 14;
    int triangle[15][15] = {
        {75},
        {95,64},
        {17,47,82},
        {18,35,87,10},
        {20,4,82,47,65},
        {19,1,23,75,3,34},
        {88,2,77,73,7,63,67},
        {99,65,4,28,6,16,70,92},
        {41,41,26,56,83,40,80,70,33},
        {41,48,72,33,47,32,37,16,94,29},
        {53,71,44,65,25,43,91,52,97,51,14},
        {70,11,33,28,77,73,17,78,39,68,17,57},
        {91,71,52,38,17,14,91,43,58,50,27,29,48},
        {63,66,4,68,89,53,67,30,73,16,69,87,40,31},
        {4,62,98,27,23,9,70,98,73,93,38,53,60,4,23}
    };
    for (int i = N - 1; i >= 0; i--) {
        for (int j = 0; j <= i; j++)
            triangle[i][j] += std::max(triangle[i+1][j],triangle[i+1][j+1]);
    }
    cout << triangle[0][0] << endl;
    return 0;
} // Answer: 1074

