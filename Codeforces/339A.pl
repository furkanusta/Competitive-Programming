#
# Codeforces
# Title: Helpful Maths
# URL  : http://codeforces.com/problemset/problem/339/A
#
use strict;
use warnings;
$_ = <>;
chomp;
my @arr = split /\+/;
print join "+", sort @arr;
