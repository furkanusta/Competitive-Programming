#
# Codeforces
# Title: Vasya and Socks
# URL  : http://codeforces.com/problemset/problem/460/A
#
use strict;
use warnings;
my ($n, $m) = split " ", <>;
print $n + int(($n - 1) / ($m - 1)) . "\n";
