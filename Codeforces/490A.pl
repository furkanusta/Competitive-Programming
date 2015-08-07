#
# Codeforces
# Title: Team Olympiad
# URL  : http://codeforces.com/problemset/problem/490/A
#
use strict;
use warnings;
my $n = <>;
my @arr = ([],[],[],[]);
my @inp = split " ", <>;
for (0..$#inp) {
    push @{$arr[$inp[$_]]}, $_+1;
}
my $ans = (sort{$a <=>$b}(scalar @{$arr[1]}, scalar @{$arr[2]}, scalar @{$arr[3]}))[0];
print $ans . "\n";

for (0..$ans-1) {
    print "@{$arr[1]}[$_] @{$arr[2]}[$_] @{$arr[3]}[$_]\n";

}
