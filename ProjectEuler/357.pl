#
# Project Euler
# Title: Prime Generating Integers
# URL  : https://projecteuler.net/problem=357
#
use strict;
use warnings;
use Math::Prime::Util ':all';
my @primes = @{primes(sqrt(100_000_000))};
my @sieve;
$sieve[$_] = 1 for(@primes);
my $sum = 0;
for my $i(2..100_000_000) {
    $sum += $i if check($i);
}
print "$sum\n";

sub check {
    my $num = shift;
    for my $i(@primes) {
        last if $i > $num;
        while ($num % $i == 0) {
            $num /= $i;
            return 0 if not $sieve[$num];
        }
    }
    return 1;
}

