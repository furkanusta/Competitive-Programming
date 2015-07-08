#
# Codeforces
# Title: Stones on the Table
# URL  : http://codeforces.com/problemset/problem/266/A
#
use strict;
use warnings;

my $l = <>;
my @str = split "", <>;
my $ans = 0;
for (1..$l-1) {
    $ans++ if ($str[$_] eq $str[$_ - 1]);
}
print $ans . "\n";
