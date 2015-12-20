#
# Codeforces
# Title: Random Teams
# URL  : http://codeforces.com/problemset/problem/478/B
#
use strict;
use warnings;
use bigint;
my ($n, $m) = split / /, <>;
my $max = ($n - $m) * ($n - $m + 1) / 2;
my $min = (($n - $n % $m) / $m * ($n - $m + ($n % $m))) / 2;
print "$min $max\n";
