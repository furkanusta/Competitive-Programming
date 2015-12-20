#
# Title: Game of Thrones - 1
# URL:https://www.hackerrank.com/contests/ieeextreme-challenges/challenges/game-of-thrones
# Difficulty: Easy
#
use strict;
use warnings;

my @arr = (0) x 255;
my $count = 0;
$arr[ord($_)]++ for(split //, <>);
$_ % 2 && $count++ for(@arr);
print ($count > 2 ? "NO\n" : "YES\n");
