#
# Codeforces
# Title: Arrival of the General
# URL  : http://codeforces.com/problemset/problem/144/A
#
use strict;
use warnings;

my $n   = <>;
my @arr = split " ", <>;
my ($min, $max) = (105, 0);
my ($x, $y) = (105, 0);

for (my $i = 0; $i < $n; $i++) {
    if ($arr[$i] <= $min) {
        $min = $arr[$i];
        $x = $i;
    }
    if ($arr[$i] > $max) {
        $max = $arr[$i];
        $y = $i;
    }
}
my $ans = $y + $n - $x - 1;
$ans-- if ($x < $y);
print $ans;
