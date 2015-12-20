#
# Codeforces
# Title: Vanya and Books
# URL  : http://codeforces.com/problemset/problem/552/B
#
# It calculates in every loop how many times the (first, second..) digit is using [$i]
#
use strict;
use warnings;
my ($s, $i) = (0, 1);
chomp(my $a = <>);
for (; $i <= $a; $s += ($a - $i + 1), $i *= 10) {};
print $s;
