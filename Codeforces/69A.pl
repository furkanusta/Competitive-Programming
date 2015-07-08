#
# Codeforces
# Title: YOung Pysicist
# URL  : http://codeforces.com/problemset/problem/69/A
#
use strict;
use warnings;

my $n = int<>;
my @arr;
my @ans = (0, 0, 0);
push @arr, [split " ", <>] for(1..$n);
for my $i(0..$n-1) {
    $ans[$_] += $arr[$i][$_] for(0..2);
}
print (!$ans[0] && !$ans[1] && !$ans[2] ? "YES\n" : "NO\n");
