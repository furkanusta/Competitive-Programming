#
# Project Euler
# Title: Ordered Fractions
# URL  : https://projecteuler.net/problem=71
#
# Explanation here: http://www.mathblog.dk/project-euler-71-proper-fractions-ascending-order/
#
use strict;
use warnings;
use Math::Simple;

my $a = 3;
my $b = 7;
my $r = 0;
my $s = 1;
my $upper = 1000000;
my $lower = 2;
my $q  = $upper;
my $p = 0;

while ($q >= $lower) {
    $p = int(($a * $q - 1) / $b);
    if ($p * $s > $r * $q) {
        $s = $q;
        $r = $p;
        $lower = int($s / ($a * $s - $b * $r));
    }
    $q--;
}
my $f = gcd($r, $s);
print $r / $f, "\n";
# Answer: 428570 	(428570/999997)
