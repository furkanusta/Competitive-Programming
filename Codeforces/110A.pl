#
# Codeforces
# Title: Nearly Lucky Number
# URL  : http://codeforces.com/problemset/problem/110/A
#
use strict;
use warnings;

my @str = split "", <>;
my $lucky = 0;
my $ans = "YES\n";
foreach(@str) {
    $lucky++ if($_ eq 4 || $_ eq 7);
}
@str = split "", $lucky;
foreach(@str) {
    $ans = "NO\n" if($_ ne 4 && $_ ne 7);
}
print $ans;
