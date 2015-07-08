#
# Codeforces
# Title: Theatre Square
# URL  : http://codeforces.com/problemset/problem/1/A
#
use strict;
use warnings;
use bigint;
my ($n, $m, $a) = split " ",<>;
print ((($n + $a - 1)) / $a * (($m + $a - 1) / $a));
