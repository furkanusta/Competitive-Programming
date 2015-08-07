#
# Codeforces
# Title: A and B and compilation errors
# URL  : http://codeforces.com/problemset/problem/519/B
#
# int$_ used instead of chomping. Two hashes was necessary because of duplicate errors.
#
use strict;
use warnings;

<>;
my %hash;
my %hash2;
$hash{int$_}++ for(split / /, <>);
$hash2{int$_}++, $hash{int$_}-- for(split / /, <>);
$hash2{int$_}-- for(split / /, <>);
print grep{$hash{$_} == 1} keys %hash;
print "\n";
print grep{$hash2{$_} == 1} keys %hash2;

