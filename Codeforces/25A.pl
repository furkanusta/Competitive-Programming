#
# Codeforces
# Title: IQ Test
# URL  : http://codeforces.com/problemset/problem/25/A
#
use strict;
use warnings;
my $n = int<>;
my $odd = 0;
my @arr = split / /, <>;
$odd += $_ % 2 for(@arr);
my %hash;
$hash{$arr[$_ - 1] % 2} = $_ foreach(1..$n);

if ($odd == 1) {
    print $hash{1};
}
else {
    print $hash{0};
}
