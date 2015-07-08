#
# Codeforces
# Title: Beautiful Matrix
# URL  : http://codeforces.com/problemset/problem/263/A
#
use strict;
use warnings;

my @arr;
$arr[$_] = [split " ", <>] for(0..4);
for my $i(0..4) {
    for my $j(0..4) {
        if ($arr[$i][$j] eq '1') {
            print (abs($i-2) + abs($j-2));
            last;
        }
    }
}
