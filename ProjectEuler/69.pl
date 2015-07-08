#
# Project Euler
# Title: Totient Maximum
# URL  : https://projecteuler.net/problem=69
#
# We are trying to find largest number less then 1M by multiplying primes.
#
use strict;
use warnings;
use Math::Prime::Util;

my $ans = 1;
my $prime = 2;
my $limit = 1000000;

while ($ans * $prime < $limit) {
    $ans = $ans * $prime;
    $prime = Math::Prime::Util::next_prime($prime);
}
print $ans, "\n";
