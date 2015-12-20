#
# Codeforces
# Title: Asphalting Roads
# URL  : http://codeforces.com/problemset/problem/583/A
#
use strict;
use warnings;

my $n = int<>;
my ($x, $y);
my @arr = (0 x 200);
for(1..$n*$n) {
    ($x, $y) = split / /, <>;
    if (!$arr[$x] && !$arr[60 + $y]) {
        print $_ . " ";
        $arr[$x] = 1;
        $arr[60 + $y] = 1;
    }
}
