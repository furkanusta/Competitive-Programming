#
# Project Euler
# Title: Combinatoric Selections
# URL : https://projecteuler.net/problem=53
#
# To speed up the process check can be done by half, because triangle is
# syymetrical
#

use strict;
use warnings;

my $ans = 0;
my @pascal = ();  # We are building a pascal triangle to calculate combinations

for my $i (1..100) {
    $pascal[$i][0] = 1;
    $pascal[$i][$i] = 1;
    for my $j (1..($i - 1)) {
        $pascal[$i][$j] = $pascal[$i - 1][$j] + $pascal[$i - 1][$j - 1];
        $ans++ if ($pascal[$i][$j] > 1e6);
    }
}
print $ans, "\n";
