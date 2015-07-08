#
# Codeforces
# Title: Double Cola
# URL  : http://codeforces.com/problemset/problem/82/A
#
use strict;
use warnings;

my @arr = qw(Sheldon Leonard Penny Rajesh Howard);
my $n = <>;
my $count = 1;

while ($n > 0) {
    for (0..4) {
        $n -= $count;
        if ($n <= 0) {
            print $arr[$_];
            last;
        }
    }
    $count *= 2;
}
