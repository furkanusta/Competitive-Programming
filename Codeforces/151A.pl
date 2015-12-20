#
# Codeforces
# Title: Soft Drinking
# URL  : http://codeforces.com/problemset/problem/151/A
#
use strict;
use warnings;

sub min{
    return $_[0] < $_[1] ? $_[0] : $_[1];
}
my ($n, $k, $l, $c, $d, $p, $nl, $np) = split / /, <>;
print min(int($k * $l / $nl / $n), min(int($p / ($n * $np)), int($c * $d / $n)));
