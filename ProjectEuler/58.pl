#
# Project Euler
# Title: Spiral Primes
# URL  : https://projecteuler.net/problem=58
#
use strict;
use warnings;
use Math::Prime::Util;
use Math::BigInt try => 'GMP';

my $primes = 3;
my $side = 2;
my $count = 9;
while( ($primes) / (2 * $side + 1) > 0.10){
    $side += 2;
    for(0..3){
        $count += $side if(Math::Prime::Util::is_prime($count));
    }
    $count+= $side;
}
print $side + 1, "\n";
