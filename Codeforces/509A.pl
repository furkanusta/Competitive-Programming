#
# Codeforces
# Title: Maximum in Table
# URL  : http://codeforces.com/problemset/problem/509/A
#
# Answer is C(2*N-2, N-1)
#
use strict;
use warnings;
use Math::BigInt;
my $n = int<>;
print Math::BigInt->bfac(2 * $n - 2) / Math::BigInt->bfac($n - 1) / Math::BigInt->bfac($n - 1);

