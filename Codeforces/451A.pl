#
# Codeforces
# Title: Game with Sticks
# URL  : http://codeforces.com/problemset/problem/451/A
#
use strict;
use warnings;
sub min{ $_[$_[0] > $_[1]] }
my ($n, $m) = split " ", <>;
my @arr = (9,10,11,0,1,2,3,4);
print min($n, $m) % 2 ? "Akshat" : "Malvika";
