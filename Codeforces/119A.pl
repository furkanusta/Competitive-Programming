#
# Codeforces
# Title: Epic Game
# URL  : http://codeforces.com/problemset/problem/119/A
#
# I am working on how ugly can a code be
#
use strict;
use warnings;

my @arr;
my ($n, $turn) = (0, 0);
($arr[0], $arr[1], $n) = split " ", <>;
$turn = !$turn while (($n-=gcd($n, $arr[$turn])) > 0);
print int($turn) . "\n";
sub gcd { return ($_[1]) ? gcd( $_[1], $_[0] % $_[1] ) : $_[0]; }
