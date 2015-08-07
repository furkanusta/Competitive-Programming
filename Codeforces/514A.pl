#
# Codeforces
# Title: Chewbacca and Number
# URL  : http://codeforces.com/problemset/problem/514/A
#
use strict;
use warnings;
my @arr = split //,<>;
my @ans = ();
for(0..$#arr-1) {
    push @ans, ($arr[$_] < 5 ? $arr[$_] : 9-$arr[$_]);
}
$ans[0] = $arr[0] if(!$ans[0]);
print @ans;
