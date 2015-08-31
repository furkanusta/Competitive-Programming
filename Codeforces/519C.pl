#
# Codeforces
# Title: A and B and Team Training
# URL  : http://codeforces.com/problemset/problem/519/C
#
use strict;
use warnings;
my ($a, $b) = split / /, <>;
print min($a, min($b, int(($a + $b) / 3)));
sub min{
    return $_[0] if ($_[0] < $_[1]);
    return $_[1];
}
