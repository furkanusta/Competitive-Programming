#
# Codeforces
# Title: Taxi
# URL  : http://codeforces.com/problemset/problem/158/B
#
use strict;
use warnings;

my $n   = <>;
my @arr = split " ", <>;
my $l   = scalar @arr - 1;
my $ans = 0;
@arr = sort @arr;
while (scalar @arr > 1) {
    if ($arr[-1] + $arr[0] <= 4) {
        push @arr, shift(@arr) + pop @arr;
    }
    else {
        $ans += int(($arr[-1] +3) / 4);
        pop @arr;
    }
}
$ans+= int(($arr[0]+3)/4) if scalar @arr;
print $ans . "\n";
