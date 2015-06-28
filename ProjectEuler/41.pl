#
# Project Euler
# Title: Pandigital Prime
# URL  : https://projecteuler.net/problem=41
#
# Except 4 and 7 digit-ones, divisible by 3
#
use strict;
use warnings;
use Algorithm::Permute;
use Math::Prime::FastSieve;
my @array = 1..7;
my $ans = 0;
my $p_iterator = Algorithm::Permute->new(\@array);
my $sieve = Math::Prime::FastSieve::Sieve->new( 7_654_322 );
while (my @perm = $p_iterator->next) {
    if ($sieve->is_prime(join("",@perm))) {
        if (join("",@perm) > $ans) {
            $ans = join("",@perm);
        }
    }
}
print $ans, "\n";

# Answer: 7652413
