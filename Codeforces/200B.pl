#
# Codeforces
# Title: Drinks
# URL  : http://codeforces.com/problemset/problem/200/B
#
use strict;
use warnings;

my $m = 100 * int<>;
my $sum = 0;
$sum += $_ for(split / /, <>);
print 100 * $sum / $m;
