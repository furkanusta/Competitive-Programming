#
# Project Euler
# Title: Counting Summations
# URL  : https://projecteuler.net/problem=76
#
use strict;
use warnings;

my @arr = (0) x 101;

$arr[0] = 1;

for my $i (1..100) {
    for my $j ($i..100) {
        $arr[$j] += $arr[$j - $i];
    }
}
print $arr[100] - 1, "\n";
#Answer: 190569291
#
# While printing the answer we are subtracting 1 because 0 + 100
# does not qualify for the answer.
