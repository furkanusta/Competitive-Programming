#
# Codeforces
# Title: Design Tutorial: Learn from Life
# URL  : http://codeforces.com/problemset/problem/472/B
#
use strict;
use warnings;

my ($n, $k) = split ' ', <>;
my @arr = sort { $a <=> $b } split (' ', <>);
my ($ans, $i) = (0,$n-1);

while($i >= 0){
    $ans += 2*($arr[$i]-1);
    $i -= $k;
}
print $ans;
