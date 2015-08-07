#
# Codeforces
# Title: Choosing Teams
# URL  : http://codeforces.com/problemset/problem/432/A
#
use strict;
use warnings;

my ($n, $k) = split / /, <>;
my $count = 0;
$_ <= 5 - $k && $count++ for(split / /, <>);
print int($count / 3);
