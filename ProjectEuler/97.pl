#
# Project Euler
# Title: Large non-Mersenne prime
# URL  : https://projecteuler.net/problem=97
#
use strict;
use warnings;
my $MOD = 10_000_000_000;
my $ans = 1;
for (1..7830457) {
    $ans = ($ans * 2) % $MOD;
}
print (($ans * 28433 + 1) % $MOD);
print "\n";
# Answer: 8739992577
