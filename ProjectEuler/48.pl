#
# Project Euler
# Title: Self Powers
# URL : https://projecteuler.net/problem=48
#
# My first useful Perl code, and I will try to solve some other problems with Perl to learn it.
# so, for a while my code might not look good.
#

use strict;
use warnings;

my $ans = 0;
my $MOD = 1e10;
my $count = 1;

for my $i (1..1000) {
    $count = 1;
    for my $j (1..$i) {
        $count = ($count * $i) % $MOD; # We only need last 10 digits.
    }
    $ans = ($ans + $count) % $MOD;
}
print $ans;

# Answer: 9110846700
