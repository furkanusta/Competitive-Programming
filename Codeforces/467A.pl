#
# Codeforces
# Title: George and Accomodation
# URL  : http://codeforces.com/problemset/problem/467/A
#
use strict;
use warnings;

my $n = <>;
my ($a, $b, $ans) = (0, 0, 0);
for (1..$n) {
    ($a, $b) = split " ", <>;
    $ans++ if ($b - $a >= 2);
}
print $ans . "\n";
