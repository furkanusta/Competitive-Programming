#
# Codeforces
# Title: Next Round
# URL  : http://codeforces.com/problemset/problem/158/A
#
use strict;
use warnings;

my ($n, $k) = split " ", <>;
my $l = <>;
my @arr = split " ", $l;
my $ans = 0;
$ans += ($_ >= $arr[$k - 1] && $_ ? 1 : 0) foreach(@arr);
$ans = 0 if ($arr[0] == 0);
print $ans, "\n";
