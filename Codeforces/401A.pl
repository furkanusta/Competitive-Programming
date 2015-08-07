#
# Codeforces
# Title: Vanya and Cards
# URL  : http://codeforces.com/problemset/problem/401/A
#
use strict;
use warnings;

my ($n, $x) = split / /, <>;
my $sum = 0;
$sum += $_ for(split / /, <>);
print int((abs($sum)+$x - 1) / $x);

