#
# Project Euler
# Title: Goldbach's other conjecture
# URL: https://projecteuler.net/problem=46
#
# I am getting sick of all those prime stuff
#

use strict;
use warnings;
use Scalar::Util::Numeric qw(isint);
my @primes;
my @factors;

sub findPrimes {
    my $N = shift @_;
    my @array;
    @array[1..$N] = 0;

    for my $i (2..$N) {
        if (!$array[$i]) {
            for (my $j = $i + $i; $j <= $N; $j += $i) {
                $array[$j] = 1;
            }
        }
    }
    for (my $i = 2; $i < scalar @array; $i++) {
        push(@primes,$i) if !$array[$i];
    }
}

for (my $i = 3; ; $i++) {
    foreach (@primes) {
        if (($i - $_) / 2
    }
}
