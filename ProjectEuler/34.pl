#
# Project Euler
# Title: Digit Factorial
# URL  : https://projecteuler.net/problem=34
#
# It is a bit slow but for now it is all I can do.
#
use strict;
use warnings;

my @factorials = (1, 1);
for (2..9) {
    $factorials[$_] = $factorials[$_ - 1] * $_;
}

my @arr;
my $sum = 0;
my $ans = 0;
for my $i (3..300_000) {
    @arr = split //, $i;
    $sum = 0;
    for(@arr) {
        $sum += $factorials[$_];
    }
    if ($sum == $i) {
        $ans+=$i;
    }
}
print $ans, "\n";

#Answer: 40730

