#
# Codeforces
# Title: Chat Room
# URL  : http://codeforces.com/problemset/problem/58/A
#
use strict;
use warnings;

my @arr = split "", <>;
my @str = split "", "hello";
my ($l, $end) = (scalar @arr, scalar @str);
my $count = 0;
for (0..$l-1) {
    $count++ if ($arr[$_] eq $str[$count]);
    last if ($count == $end);
}
print $count == $end ? "YES\n":"NO\n";
