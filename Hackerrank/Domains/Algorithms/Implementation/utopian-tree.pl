#
# Title: Utopian Tree
# URL: https://www.hackerrank.com/challenges/utopian-tree
# Difficulty: Easy
#
use strict;
use warnings;
my $n;
for(1..int<>) {
    $n = int<>;
    CORE::say ~(~1<<($n>>1)) << $n%2;
}


=pod

1 2 3 4 5  6  7  8  9 10 11
1 2 3 6 7 14 15 30 31 62 63


=cut
