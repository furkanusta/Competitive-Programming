#
# Codeforces
# Title: Drazil and Factorial
# URL  : http://codeforces.com/problemset/problem/515/C
#
# Tutorial explains the solution http://codeforces.com/blog/entry/16468
#
use strict;
use warnings;

<>;
my $inp = int <>;

$inp =~ tr/01//d;
$inp =~ s/4/223/g;
$inp =~ s/6/53/g;
$inp =~ s/8/7222/g;
$inp =~ s/9/7332/g;
print reverse sort split //, $inp;
