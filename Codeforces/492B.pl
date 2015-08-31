#
# Codeforces
# Title: Vanya and Lanterns
# URL  : http://codeforces.com/problemset/problem/492/B
#
use strict;
use warnings;
my ($n, $m) = split / /,<>;
my @arr = sort {$a <=> $b} map {$_ = int$_} split / /, <>;
@arr = (-$arr[0], @arr, $m + $m - $arr[-1]);
my $max = 0;
for(1..$n+1) {
    $max = $arr[$_] - $arr[$_ - 1] if ($arr[$_] - $arr[$_ - 1] > $max);
}
print $max / 2;
