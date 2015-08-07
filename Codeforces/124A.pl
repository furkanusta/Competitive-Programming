#
# Codeforces
# Title: The number of positions
# URL  : http://codeforces.com/problemset/problem/124/A
#
use strict;
use warnings;
my ($n, $a, $b) = split ' ', <>;
print (($n - $a < $b + 1) ? $n - $a : $b + 1);
