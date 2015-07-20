#
# Codeforces
# Title: Free Cash
# URL  : http://codeforces.com/problemset/problem/237/A
#
use strict;
use warnings;
my %hash;
my $n = int<>;
my $max = 0;
$hash{<>}++ for(1..$n);
for(values %hash) {
    $max = $_ if ($_ > $max);
}
print $max;
