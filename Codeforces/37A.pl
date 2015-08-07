#
# Codeforces
# Title: Towers
# URL  : http://codeforces.com/problemset/problem/37/A
#
use strict;
use warnings;

<>;
my %hash;
my $max  = 0;
for(split / /, <>) {
    $hash{int$_}++;
    $max = $hash{int$_} if ($hash{int$_} > $max);
}
print ($max . " " . scalar keys %hash);
