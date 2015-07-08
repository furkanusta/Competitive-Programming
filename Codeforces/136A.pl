#
# Codeforces
# Title: Presents
# URL  : http://codeforces.com/problemset/problem/136/A
#
use strict;
use warnings;
my $n = <>;
my @arr = split " ", <>;
my @ans = (0) x $n;
for (0..$n-1) {
    $ans[$arr[$_]] = $_ + 1;
}
shift @ans;
print "@ans\n";
