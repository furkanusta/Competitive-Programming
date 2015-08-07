#
# Project Euler
# Title: COnvergents of e
# URL  : https://projecteuler.net/problem=65
#
use strict;
use warnings;
use bigint;

my ($ans, $d, $n, $c, $temp) = (0, 1, 2, 0, 0);
for (my $i = 2; $i <= 100; $i++) {
    $temp = $d;
    $c = ($i % 3) ? 1 : 2 * ($i / 3);
    $d = $n;
    $n = $c * $d + $temp;
}
$ans += int$_ for(split //, $n);
print $ans;
# Answer: 272
