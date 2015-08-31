#
# Codeforces
# Title: Laptops
# URL  : http://codeforces.com/problemset/problem/456/A
#
use strict;
use warnings;

my ($a, $b, $f) = (0, 0, 0);
for(1..<>) {
    ($a, $b) = split / /, <>;
    $a != $b and $f = 1;
}
print $f ? "Happy Alex" : "Poor Alex";
