#
# Codeforces
# Title: Xenia and Ringroad
# URL  : http://codeforces.com/problemset/problem/339/B
#
use strict;
use warnings;

my ($n, $m) = split / /, <>;
my @arr = split / /, <>;
my $ans = $arr[0];
for (my $i = 1; $i < scalar @arr; $i++) {
    if ($arr[$i] >= $arr[$i - 1]) {
        $ans += $arr[$i] - $arr[$i - 1];
    }
    else {
        $ans += $n - $arr[$i - 1] + $arr[$i];
    }
    # print $ans . "\n";
}
print $ans - 1 . "\n";
