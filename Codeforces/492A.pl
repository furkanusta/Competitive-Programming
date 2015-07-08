#
# Codeforces
# Title: Vanya and Cubes
# URL  : http://codeforces.com/problemset/problem/492/A
#
use strict;
use warnings;
my $n = int<>;
for (my $i = 1;;$i++) {
    $n -= int($i * ($i + 1) / 2);
    if ($n < 0) {
        print $i - 1;
        last;
    }
}
