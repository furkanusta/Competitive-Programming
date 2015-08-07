#
# Codeforces
# Title: Drazil and Date
# URL  : http://codeforces.com/problemset/problem/510/A
#
use strict;
use warnings;
my ($a, $b, $s) = split " ", <>;
$s -= abs($a) + abs($b);
if ($s >= 0 && $s % 2 == 0) {
    print "Yes\n";
}
else {
    print "No\n";
}
