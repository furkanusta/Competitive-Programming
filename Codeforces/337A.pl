#
# Codeforces
# Title: Puzzle
# URL  : http://codeforces.com/problemset/problem/337/A
#
use strict;
use warnings;
my ($n, $m) = split " ", <>;
my @arr = sort {$a<=>$b} split " ", <>;
my $min = 999;
for (0..$m-$n) {
    if ($arr[$_ + $n - 1] - $arr[$_] < $min) {
        $min = $arr[$_ + $n - 1] - $arr[$_];
    }
}
print $min . "\n";
