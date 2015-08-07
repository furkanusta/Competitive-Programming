#
# Codeforces
# Title: Dragons
# URL  : http://codeforces.com/problemset/problem/230/A
#
# Sort and keep killing as long as you can
# Greedy
#
use strict;
use warnings;

my ($x, $n) = split " ", <>;
my ($str, $bonus) = (0, 0);
my $ans = "YES\n";
my @arr;
push @arr, [split " ", <>] for (1..$n);
@arr = sort {$a->[0] <=> $b->[0]} @arr;
for my $i(0..$n-1) {
    if ($x > $arr[$i][0]) {
        $x += $arr[$i][1];
    }
    else {
        $ans = "NO\n";
    }
}
print $ans;
