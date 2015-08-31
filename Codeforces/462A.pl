#
# Codeforces
# Title: Appleman and Easy Task
# URL  : http://codeforces.com/problemset/problem/462/A
#
use strict;
use warnings;

my $n = int<>;
my @arr = [split //, 0 x ($n+2)];
($arr[$_]='0'.<>.'0') =~ tr/xo\n/01/d for(1..$n);
$arr[$_] = [split //,$arr[$_]] for(1..$n);
my $ans = "YES\n";
Outer:
for my $i(1..$n) {
    for my $j(1..$n) {
        if (($arr[$i - 1][$j] + $arr[$i + 1][$j] + $arr[$i][$j - 1] + $arr[$i][$j + 1]) % 2 != 0) {
            $ans = "NO\n";
            last Outer;
        }
    }
}
print $ans;
