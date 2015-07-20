#
# Codeforces
# Title: I_love_%username%
# URL  : http://codeforces.com/problemset/problem/155/A
#
use strict;
use warnings;
my $n = int<>;
my ($min, $max, $ans) = (10001, -1, 0);

foreach(split / /, <>) {
    if ($_ < $min) {
        $ans++;
        $min = $_;
    }
    if ($_ > $max) {
        $ans++;
        $max = $_;
    }
}
print $ans - 2 . "\n";
