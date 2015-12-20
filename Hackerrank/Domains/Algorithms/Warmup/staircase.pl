#
# Title: Staircase
# URL: https://www.hackerrank.com/challenges/staircase
# Difficulty: Easy
#
use strict;
use warnings;
my $n = int<>;
print ((" " x ($n - $_)) . ("#" x $_) . "\n") for(0..$n);
