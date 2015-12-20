#
# Title: Diagonal Difference
# URL: https://www.hackerrank.com/challenges/diagonal-difference
# Difficulty: Easy
#
use strict;
use warnings;
my $n = int<> - 1;
my @arr;
my $sum = 0;
$arr[$_] = [split / /, <>] for(0..$n);
$sum += $arr[$_][$_] - $arr[$_][$n - $_] for(0..$n);
print abs($sum);
