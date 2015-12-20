#
# Title: Extra Long Factorials
# URL: https://www.hackerrank.com/challenges/extra-long-factorials
# Difficulty: Moderate
#
use strict;
use warnings;
use bigint;
my $ans = 1;
$ans *= $_ for(2..<>);
print $ans;
