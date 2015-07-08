#
# Codeforces
# Title: Ultra-Fast Mathematician
# URL  : http://codeforces.com/problemset/problem/61/A
#
use strict;
use warnings;

my @a = split "", <>;
my @b = split "", <>;
my @c;
$c[$_] = int($a[$_]) ^ int($b[$_]) for (0..scalar @a - 2);
print @c;
