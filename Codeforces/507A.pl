#
# Codeforces
# Title: Amr and Music
# URL  : http://codeforces.com/problemset/problem/507/A
#
use strict;
use warnings;
my($n, $k) = split / /, <>;
my @inp = split " ", <>;
my $num = 0;
my @ans = ();
my @arr = ();
for (0..$n-1) {
    push @arr, [$inp[$_], $_+1];
}
@arr = sort{$a->[0] <=> $b->[0]} @arr;
for (@arr) {
    last if ($k - $_->[0] < 0);
    $k -= $_->[0];
    $num++;
    push @ans, $_->[1];
}
print "$num\n@ans\n";
