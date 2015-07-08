#
# Codeforces
# Title: Design Tutorial: Learn from Math
# URL  : http://codeforces.com/problemset/problem/472/A
#
use strict;
use warnings;

my $n = int(<>);
if ($n % 2) {
    print "9 " . ($n - 9) . "\n";
}
else {
    print "4 " . ($n - 4) . "\n";
}
