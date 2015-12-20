#
# Codeforces
# Title: Soldier and Badges
# URL  : http://codeforces.com/problemset/problem/546/B
#
use strict;
use warnings;
<>;
my @arr = sort {$a <=> $b} split / /, <>;
my $ans = 0;
for(1..scalar @arr - 1) {
    if ($arr[$_] <= $arr[$_ - 1]) {
        $ans += $arr[$_ - 1] - $arr[$_] + 1;
        $arr[$_] = $arr[$_ - 1] + 1;
    }
}
print $ans;
