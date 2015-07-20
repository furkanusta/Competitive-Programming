#
# Codeforces
# Title: Even Odds
# URL  : http://codeforces.com/problemset/problem/318/A
#
use strict;
use warnings;
my ($n, $k) = split / /, <>;
if ($k <= ($n +1) / 2) {
    print 2 * $k - 1;
}
else {
    print (int($k - $n / 2) * 2);
}
