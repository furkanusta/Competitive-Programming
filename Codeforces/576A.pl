#
# Codeforces
# Title: Vasya and Petya's Game
# URL  : http://codeforces.com/problemset/problem/576/A
#
use strict;
use warnings;

my ($n, $x) = split / /, <>;
my $min = $n < $x ? $n : $x;
my $ans = 0;
for(1..$min) {
    if ($x % $_ == 0 && $x / $_ <= $n) {
        $ans++;
    }
}
print "$ans\n";

