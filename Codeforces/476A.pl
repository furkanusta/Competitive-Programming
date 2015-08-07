#
# Codeforces
# Title: Dreamoon and Stairs
# URL  : http://codeforces.com/problemset/problem/476/A
#
use strict;
use warnings;
my ($n, $m) = split " ", <>;
my $lb  = int (($n+1)/2);
my $ans = int (($lb + $m - 1) / $m) * $m;
print ($ans > $n ? -1 : $ans);
