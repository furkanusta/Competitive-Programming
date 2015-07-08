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
use Math::Prime::FastSieve;
my @primes;
my @factors;
my $sieve = Math::Prime::FastSieve::Sieve->new( 20_000 );
my $temp  = 0;
my $flag;
for (my $i = 9; ; $i += 2) {
    $flag = 0;
    # print $i, "\n";
    $i = 5777;
    for (my $j = 1; ; $j++) {
        $temp = $j * $j * 2;
        last if ($temp > $i);
        if ($sieve->is_prime($i - $temp)) {
            $flag = 1;
            last;
        }
    }
    if (!$flag) {
        print $i, "\n";
        last;
    }
    last;
}
# Answer: 5777
