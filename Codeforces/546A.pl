#
# Codeforces
# Title: Soldier and Bananas
# URL  : http://codeforces.com/problemset/problem/546/A
#
use strict;
use warnings;

my ($k, $n, $w) = split " ", <>;
my $ans = $w * ($w + 1) / 2 * $k - $n;
print $ans < 0 ? "0\n" : "$ans\n";
