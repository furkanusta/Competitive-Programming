#
# Codeforces
# Title: Insomnia Cure
# URL  : http://codeforces.com/problemset/problem/146/A
#
use strict;
use warnings;

my @arr;
$arr[$_] = <> for(0..3);
my $d   = <>;
my @count = (0) x int($d);
my $ans = 0;
for my $i (0..3) {
    $count[$_ * $arr[$i]] = 1 for(0..int($d/$arr[$i]));
}
$ans += $count[$_] for(1..$d);
print $ans;

