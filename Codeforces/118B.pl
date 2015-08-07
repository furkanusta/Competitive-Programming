#
# Codeforces
# Title: Present from Lena
# URL  : http://codeforces.com/problemset/problem/118/B
#
use strict;
use warnings;

my $n = int<>;
my @arr;
for (0..$n) {
    @arr = (0..$_, reverse 0..$_-1);
    print ' ' x (($n - $_) * 2), "@arr\n";
}
for (my $i = $n - 1; $i >=0; $i--) {
    @arr = (0..$i, reverse 0..$i-1);
    print ' ' x (($n - $i) * 2), "@arr\n";
}
