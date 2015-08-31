#
# Codeforces
# Title: Candy Bags
# URL  : http://codeforces.com/problemset/problem/334/A
#
# Original Idea: http://codeforces.com/contest/334/submission/4384534
# It pairs as (1, N*N) , (2, N*N-1) ... and prints that pairs
# It works because of the Codeforces's parsing method
#
use strict;
use warnings;
my $n = int<>**2;
print $n-- . " $_\n" for(1..$n / 2);
