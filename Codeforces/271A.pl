#
# Codeforces
# Title: Beautiful Year
# URL  : http://codeforces.com/problemset/problem/271/A
#
use strict;
use warnings;

my $n = int(<>);
my %hash;
for (my $i= $n + 1;;$i++) {
    undef %hash;
    %hash = map { $_, 1 } split "", $i;
    if (scalar keys %hash == 4) {
        print $i;
        last;
    }
}

