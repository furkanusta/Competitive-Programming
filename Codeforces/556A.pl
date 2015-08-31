#
# Codeforces
# Title: Case of the Zeroes and Ones
# URL  : http://codeforces.com/problemset/problem/556/A
#
use strict;
use warnings;
my $n = int<>;
my @arr = split //, <>;
my @stack = ();
my $ans = $n;
push @stack, shift @arr;
for (2..$n) {
    push @stack, shift @arr;
    if (scalar @stack > 1 && $stack[-1] != $stack[-2]) {
        pop @stack;
        pop @stack;
    }
}
print scalar @stack;
