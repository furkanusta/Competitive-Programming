#
# Codeforces
# Title: System of Equations
# URL  : http://codeforces.com/problemset/problem/214/A
#
use strict;
use warnings;
my ($n, $m) = split " ", <>;
my $ans = 0;
for my $a(0..1000) {
    for my $b(0..1000) {
        $ans++ if($a * $a + $b == $n && $b * $b + $a == $m);
        last if ($a * $a + $b > $n || $b * $b + $a > $m);
    }
}
print $ans . "\n";
