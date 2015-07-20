#
# Codeforces
# Title: Buttons
# URL  : http://codeforces.com/problemset/problem/268/B
#
use strict;
use warnings;

use bigint;
my $n = int<>;
my $ans = 0;
$ans += ($n - $_) * $_ for(1..$n);
print $ans + $n;

