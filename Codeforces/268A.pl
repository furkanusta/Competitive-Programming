#
# Codeforces
# Title: Games
# URL  : http://codeforces.com/problemset/problem/268/A
#
use strict;
use warnings;
my $n = int<>;
my @arr;
my $ans = 0;
push @arr, [split " ", <>] for (1..$n);

for my $i(1..$n-1) {
    for my $j(0..$i-1) {
        $ans++ if ($arr[$i][0] == $arr[$j][1]);
        $ans++ if ($arr[$i][1] == $arr[$j][0]);
    }
}
print $ans . "\n";
