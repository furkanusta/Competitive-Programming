#
# Title: Magic Square
# URL:https://www.hackerrank.com/contests/ieeextreme-challenges/challenges/magic-square
# Difficulty: Easy
#
use strict;
use warnings;

my $n = int<> - 1;
my (@arr, @ans);
my ($sum, $main) = (0, 0);
$arr[$_] = [split / /, <>] for(0..$n);
$main += $arr[$_][$_] for(0..$n);
for my $i(0..$n) {
    $sum = 0;
    $sum += $arr[$i][$_] for(0..$n);
    push @ans, $i+1 if($sum != $main);

    $sum = 0;
    $sum += $arr[$_][$i] for(0..$n);
    push @ans, -$i-1 if($sum != $main);
}
$main -= $arr[$_][$n - $_] for(0..$n);
push @ans, 0 if($main);

print @ans . "\n";
print join("\n", sort {$a <=> $b} @ans);
