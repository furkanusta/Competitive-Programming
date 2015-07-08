#
# Codeforces
# Title: Domino Piling
# URL  : http://codeforces.com/problemset/problem/50/A
#
use strict;
use warnings;
my @a = split " ", <>;
print int($a[0] / 2) * $a[1] + ($a[0] % 2 ? int($a[1] / 2) : 0) . "\n";

