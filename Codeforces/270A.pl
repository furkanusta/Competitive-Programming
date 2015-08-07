#
# Codeforces
# Title: Fancy Fence
# URL  : http://codeforces.com/problemset/problem/270/A
#
use strict;
use warnings;
my $n = <>;
my $t;
for(1..$n) {
    $t = <>;
    if (360 % (180 - $t) == 0) {
        print "YES\n";
    }
    else {
        print "NO\n";
    }
}
