#
# Codeforces
# Title: Cheap Travel
# URL  : http://codeforces.com/problemset/problem/466/A
#
use strict;
use warnings;

my ($n, $m, $a, $b) = split / /, <>;
my $ans = 0;
if ($b < $m * $a) {
    $ans = int($n / $m) * $b;
    $n %= $m;
}
else {
    $ans = $n * $a;
    $n = 0;
}
if ($n) {
    if ($b < $a * $n) {
        $ans += $b;
    }
    else {
        $ans += $a * $n;
    }
}
print $ans . "\n";
