#
# Codeforces
# Title: Tram
# URL  : http://codeforces.com/problemset/problem/116/A
#
use strict;
use warnings;

my $n = <>;
my ($a, $b, $pas, $ans) = (0, 0, 0, 0);
for (1..$n) {
    ($a, $b) = split " ", <>;
    $pas -= $a - $b;
    $ans = $pas if ($pas > $ans);
}
print $ans ,"\n";
