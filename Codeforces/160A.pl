#
# Codeforces
# Title: Twins
# URL  : http://codeforces.com/problemset/problem/160/A
#
use strict;
use warnings;
my $n = <>;
my @arr = reverse sort { $a <=> $b } split " ", <>;
my ($mid, $ans, $sum) = (0, 0, 0);
$mid += $_ foreach(@arr);
$mid = int($mid / 2);

foreach(@arr) {
    $sum += $_;
    $ans++;
    last if ($sum > $mid);
}
print "$ans\n";
