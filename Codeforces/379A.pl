#
# Codeforces
# Title: New Year Candles
# URL  : http://codeforces.com/problemset/problem/379/A
#
use strict;
use warnings;

my ($a, $b) = split " ", <>;
my $ans = 0;
while ($a > 0) {
    $ans += $a - $a % $b;
    $a = $a % $b + int($a / $b);
    last if ($a < $b);
}
print $ans + $a . "\n";
