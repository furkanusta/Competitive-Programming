#
# Codeforces
# Title: Flipping Game
# URL  : http://codeforces.com/problemset/problem/327/A
#
use strict;
use warnings;

<>;
my ($max, $i, $j, $k) = 0;
for (split / /, <>){
    ($i--,$j++) if($_ == 1);
    $i = 0      if ($i < 0);
    ($i++,$k++) if($_ == 0);
    $max=$i     if($i > $max);
}
$max-- unless $k;               # Because we need exactly one move
print $max + $j . "\n";
