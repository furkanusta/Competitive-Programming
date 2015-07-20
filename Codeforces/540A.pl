#
# Codeforces
# Title: Combination Lock
# URL  : http://codeforces.com/problemset/problem/540/A
#
use strict;
use warnings;
sub min{
    return $_[1] < $_[0] ? $_[1] : $_[0];
}
my $n = int<>;
my @lock = split //, <>;
my @arr  = split //, <>;
my $ans  = 0;
for my $i(0..$n-1) {
    $ans += min(abs($lock[$i] - $arr[$i]), abs(10 - abs($lock[$i] - $arr[$i])));
}
print $ans . "\n";
