#
# Title: Sherlock And The Beast
# URL: https://www.hackerrank.com/challenges/Sherlock-and-the-Beast
# Difficulty: Easy
#
use strict;
use warnings;
my ($n, $ans);
for(1..int<>) {
    $n = int<>;
    $ans = "-1\n";
    for(my $i = int($n / 3) * 3; $i >= 0; $i-=3) {
        if (($n - $i) % 5 == 0) {
            $ans = ('5' x $i) . ('3' x ($n - $i)) . "\n";
            last;
        }
    }
    print $ans;
}
