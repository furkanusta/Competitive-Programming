#
# Codeforces
# Title: Fox and Snake
# URL  : http://codeforces.com/problemset/problem/510/A
#
use strict;
use warnings;

my ($n, $m) = split " ", <>;
for my $i(1..$n) {
    if ($i % 2) {
        print '#' x $m, "\n";
    }
    else {
        if ($i % 4 == 0) {
            print '#', '.' x int($m-1) , "\n";
        }
        else {
            print '.' x int($m-1) , "#\n";
        }
    }
}
