#
# Codeforces
# Title: Little Pony and Crystal Mine
# URL  : http://codeforces.com/problemset/problem/454/A
#
use strict;
use warnings;
my $n = <>;
for (my $i = 1; $i < $n; $i += 2) {
    print "*" x int(($n - $i) / 2);
    print "D" x $i;
    print "*" x int(($n - $i) / 2);
    print "\n";
}
for (my $i = $n; $i > 0; $i -=2) {
    print "*" x int(($n - $i) / 2);
    print "D" x $i;
    print "*" x int(($n - $i) / 2);
    print "\n";
}
