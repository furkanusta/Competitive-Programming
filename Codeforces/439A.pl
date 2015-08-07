#
# Codeforces
# Title: Devu, the Singer and Churu, the Joker
# URL  : http://codeforces.com/problemset/problem/439/A
#
use strict;
use warnings;

my ($n, $d) = split / /, <>;
my $sum = 0;
my $ans = -1;
$sum += $_ for(split / /, <>);
$ans = int(($d - $sum)/5)  if ($sum + 10 * ($n - 1) <= $d);
print $ans . "\n";
