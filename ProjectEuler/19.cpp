/*
 * Projet Euler
 * Title: Counting Sundays
 * URL: https://projecteuler.net/problem=19
 * Author: Furkan Usta
 * Sat Jun 13 21:26:54 2015

   I am using boost library for counting, some say that is cheating
   but I think it is important to make use of other-libraries there is
   no need to invent the wheel again.

   However, if you are new and trying to learn things you can implement
   this with using 3 variables for year,month and date isntead of boost
   library, and iterate until the end point by 7.

   int months[] = {31,28,31,30,31,30,31,31,30,31,30,31};

   You can use this to check overflow for days but be careful with
   leap days
 */
#include "boost/date_time/gregorian/gregorian_types.hpp"
#include <iostream>
using std::cout;
using std::endl;
using namespace boost::gregorian;
int main(int argc, char *argv[])
{
    int ans = 0;
    for (date dt(1901,6,7), end(2000,12,31); dt <= end; dt += days(7))
        ans += dt.day() == 1;
    cout << ans << endl;
    return 0;
} // Answer: 171
