#
# Codeforces
# Title: Magnets
# URL  : http://codeforces.com/problemset/problem/344/A
#
use strict;
use warnings;

my $n = <>;
my ($now, $last, $ans) = ("0", "0", 0);

for (1..$n) {
    $now = <>;
    $ans++ if ($now ne $last);
    $last = $now;
}
print $ans . "\n";
