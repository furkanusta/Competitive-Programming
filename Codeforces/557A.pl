#
# Codeforces
# Title: Ilya and Diplomas
# URL  : http://codeforces.com/problemset/problem/557/A
#
use strict;
use warnings;

sub min {
    return $_[0] < $_[1] ? $_[0] : $_[1];
}

my $n = int<>;
my @arr;
$arr[$_] = [split / /, <>] foreach (0 .. 2);

my $a = int(min($n - $arr[1][0] - $arr[2][0], $arr[0][1]));
$n -= $a;
my $b = int(min($n - $arr[2][0], $arr[1][1]));
my $c = $n - $b;
print "$a $b $c\n";
