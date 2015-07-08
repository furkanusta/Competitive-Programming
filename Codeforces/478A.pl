#
# Codeforces
# Title: Initial Bet
# URL  : http://codeforces.com/problemset/problem/478/A
#
use strict;
use warnings;

my @c = split " ", <>;
my $sum = 0;
$sum += int($_) foreach(@c);

if ($sum == 0 || $sum % 5 != 0) {
    print "-1\n";
}
else {
    print $sum / 5;
}


