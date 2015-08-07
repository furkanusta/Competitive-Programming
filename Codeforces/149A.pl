#
# Codeforces
# Title: Business Trip
# URL  : http://codeforces.com/problemset/problem/149/A
#
use strict;
use warnings;

my $k = <>;
my @arr = reverse sort {$a <=> $b} split " ", <>;
my $ans = 0;
for(my $i = 0; $k > 0 && $i < scalar @arr; $i++) {
    $k -= $arr[$i];
    $ans++;
    last if ($k <= 0);
}
$ans = -1 if ($k > 0);
print $ans;

