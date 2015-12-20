#
# Title: Sherlock And Squares
# URL: https://www.hackerrank.com/challenges/sherlock-and-squares
# Difficulty: Easy
#
use strict;
use warnings;
use POSIX;
for(1..int<>) {
    my ($a, $b) = split / /, <>;
    CORE::say (floor(sqrt($b)) - ceil(sqrt($a)) + 1);
}
