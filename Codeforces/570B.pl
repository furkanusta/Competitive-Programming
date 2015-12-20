#
# Codeforces
# Title: Simple Game
# URL  : http://codeforces.com/problemset/problem/570/B
#
use strict;
use warnings;

my ($n, $m) = split / /, <>;
my $ans = $m + (($n - $m > $m - 1) ? +1 : -1);
$ans = 1 if (not $ans);
print $ans . "\n";
