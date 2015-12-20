#
# Title: Matrix Rotation [Algo]
# URL: https://www.hackerrank.com/challenges/matrix-rotation-algo
# Difficulty: Difficult
#
# Code is a bit ugly but I didn't want to shift it one-by-one
# Thus I flattened the array then shifted all at once then shaped it into array again
# While flattening and reverting back order is top row, rightmost column, bottom row, leftmost column
#
use strict;
use warnings;

my ($n, $m, $r) = split / /, <>;
($n, $m) = ($n - 1, $m - 1);
my $min = int($n < $m ? $n/2 : $m/2);
my $len;
my (@arr, @string, @temp);
for(0..$n) {
    $arr[$_] = [split / /, <>];
    chomp($arr[$_][-1]);
}
for my $i(0..$min) {
    $string[$i] = [@{$arr[$i]}[$i..$m-$i]];
    push @{$string[$i]}, $arr[$_][$m - $i] for(($i+1)..($n-$i-1));
    push @{$string[$i]}, reverse @{$arr[$n - $i]}[$i..$m-$i];
    push @{$string[$i]}, $arr[$n - $_][$i] for(($i+1)..($n-$i-1));
}
for my $i(0..$min) {
    undef @temp;
    $len = scalar @{$string[$i]};
    $temp[$_] = $string[$i][($_ + $r) % $len] for(0..$len-1);
    $arr[$i][$_]           = shift @temp for($i      ..($m - $i));
    $arr[$_][$m - $i]      = shift @temp for(($i + 1)..($n - $i - 1));
    $arr[$n - $i][$m - $_] = shift @temp for($i      ..($m - $i));
    $arr[$n - $_][$i]      = shift @temp for((1+$i)  ..($n-$i-1));
}
CORE::say "@{$arr[$_]}" for(0..$n);
