#
# Codeforces
# Title: Elections
# URL  : http://codeforces.com/problemset/problem/570/A
#
use strict;
use warnings;

sub max {
    my $max = 0;
    for my $i(1..$#_) {
        $max = $i if ($_[$i] > $_[$max]);
    }
    return $max;
}
my ($n, $m) = split / /, <>;
my @arr = (0) x $n;
for (0..$m-1) {
    $arr[max(split / /, <>)]++;
}
print max(@arr) + 1
