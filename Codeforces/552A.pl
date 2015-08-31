#
# Codeforces
# Title: Vanya and Table
# URL  : http://codeforces.com/problemset/problem/552/A
#
use strict;
use warnings;
my $n = int<>;
my $ans = 0;
my ($x1, $y1, $x2, $y2);
for(1..$n) {
    ($x1, $y1, $x2, $y2) = split / /, <>;
    $ans += ($y2 - $y1 + 1) * ($x2 - $x1 + 1);
}
print $ans;
