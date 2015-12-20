#
# Title: Sum It Up
# URL:https://www.hackerrank.com/contests/ieeextreme-challenges/challenges/sum-it-up
# Difficulty: Difficult
#
use strict;
use warnings;
<>;
my @arr = split / /, <>;
my $sum = 0;
$sum += $_ for(@arr);
$sum = ($sum * 2) % (1e9+7) for(1..<>);
print $sum;
