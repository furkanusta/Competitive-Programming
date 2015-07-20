#
# Codeforces
# Title: A and B and chess
# URL  : http://codeforces.com/problemset/problem/519/A
#
# There is an another cool solution with using eval and concatenating items with +
#
use strict;
use warnings;
my $ans = "White";
my %hash = ('q' => 9, 'r' => 5, 'b' => 3, 'n' => 3, 'p' => 1, 'k' => 0);
my $winner = 0;
for (0..7) {
    $winner += exists($hash{lc $_}) ? ($_ eq lc $_ ? -$hash{$_} : $hash{lc $_}) : 0 foreach (split //, <>);
}
$ans = "Black\n" if ($winner < 0);
$ans = "Draw\n"  if ($winner == 0);
print $ans;
