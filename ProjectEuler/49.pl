#
# Project Euler
# Title: Prime Permutations
# URL : https://projecteuler.net/problem=49
#
#
use strict;
use warnings;

my @primes = ();

for (1..10000) {
    $primes[$_] = 0;
}
sub findPrimes() {
    $primes[2] = 1;

    for my $i (2..10000) {
        if (!$primes[$i]) {
            for (my $j =  $i + $i; $j < 10000; $j+= $i) {
                $primes[$j] = 0;
            }
        }
    }
}

for my $i (1000..9999) {

}
