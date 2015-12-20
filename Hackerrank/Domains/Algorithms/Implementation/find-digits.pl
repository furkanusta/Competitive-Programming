#
# Title: Find Digits
# URL: https://www.hackerrank.com/challenges/find-digits
# Difficulty: Easy
#
use strict;
use warnings;
for(1..int<>) {
    my $n = int<>;
    CORE::say scalar grep {$_ && not ($n % $_);} split //, $n;
}
