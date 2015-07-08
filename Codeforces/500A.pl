#
# Codeforces
# Title: New Year Transportation
# URL  : http://codeforces.com/problemset/problem/500/A
#
use strict;
use warnings;

my ($n, $t) = split " ", <>;
my @arr = split " ", <>;
unshift @arr, 0;
my $pos = 1;
$pos += $arr[$pos] while ($pos < $t);
print ($pos == $t ? "YES\n" : "NO\n");
