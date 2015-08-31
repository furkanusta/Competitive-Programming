#
# Project Euler
# Title: Arranged Probability
# URL  : https://projecteuler.net/problem=100
#
# For the mathematical explanation: http://www.mathblog.dk/project-euler-100-blue-discs-two-blue/
#
use strict;
use warnings;
# use biginteger;
my ($b, $n) = (15, 21);
($b, $n) = (3 * $b + 2 * $n - 2, 4 * $b + 3 * $n - 3) while ($n < 1e12);
print $b . "\n";

# Answer: 756872327473
