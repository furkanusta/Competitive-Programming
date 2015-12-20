#
# Codeforces
# Title: Circle Line
# URL  : http://codeforces.com/problemset/problem/278/A
#
use strict;
use warnings;
my $n = int<>;
my @arr = (0, split / /, <>);
my ($s, $t) = split / /, <>;
($s, $t) = ($t, $s) if ($s > $t);
my ($temp, $ans) = (0, 0);
$ans += $arr[$_] for ($s..$t-1);
$temp += $arr[$_] for (1..$s-1);
$temp += $arr[$_] for ($t..$n);
print $ans < $temp ? $ans : $temp;
