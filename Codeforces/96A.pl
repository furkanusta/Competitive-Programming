#
# Codeforces
# Title: Fottball
# URL  : http://codeforces.com/problemset/problem/96/A
#
use strict;
use warnings;

my $str = <>;
if (index($str, "1111111") != -1 || index($str, "0000000") != -1) {
    print "YES\n";
}
else {
    print "NO\n";
}
