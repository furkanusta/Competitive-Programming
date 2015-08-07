#
# Codeforces
# Title: GukiZ and Contest
# URL  : http://codeforces.com/problemset/problem/551/A
#
use strict;
use warnings;

my $n = int<>;
my @arr = split / /, <>;
my @ans;
@arr = reverse sort{$a->[0] <=> $b-[0]} map{[$arr[$_], $_]} 0..$n-1;
for my $i(0..$n-1) {
    $ans[$arr[$i]->[1]] = 1 + grep {$arr[$i]->[0] < $_->[0]} @arr;
}
print "@ans\n";
