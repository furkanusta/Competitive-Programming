#
# Codeforces
# Title: Black Square
# URL  : http://codeforces.com/problemset/problem/431/A
#
use strict;
use warnings;

my @arr = (0, split / /, <>);
my $ans = 0;
for (split //, <>) {
    $ans += $arr[$_];    # There is a warning for '\n' because we didn't chomp
}			 # However, codeforces ignores and program runs
print $ans . "\n";
