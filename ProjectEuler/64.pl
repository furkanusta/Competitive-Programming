#
# Project Euler
# Title: Odd Period Square Roots
# URL  : https://projecteuler.net/problem=64
#
use strict;
use warnings;
use integer;
my ($d, $m, $a, $period, $limit) = 0;
my $result = 0;
for (my $i = 2; $i <= 10000; $i++) {
    $limit = sqrt $i;
    next if ($limit * $limit == $i);
    ($period, $m, $d, $a) = (0, 0, 1, $limit);
    do {
        $m = $d * $a - $m;
        $d = ($i - $m * $m) / $d;
        $a = ($limit + $m) / $d;
        $period++;
    } while ($a != 2 * $limit);
    $result++ if ($period % 2 == 1);
}
print $result;
# Answer : 1322
