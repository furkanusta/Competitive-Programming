#
# Codeforces
# Title: Expression
# URL  : http://codeforces.com/problemset/problem/479/A
#
use strict;
use warnings;

my $a = int<>;
my $b = int<>;
my $c = int<>;
print max($a * $b * $c, ($a + $b) * $c, $a * ($b + $c), $a + $b + $c);

sub max {
    my ($x, $y, $z, $w) = @_;
    return $x if ($x >= $y && $x >= $z && $x >= $w);
    return $y if ($y >= $x && $y >= $z && $y >= $w);
    return $z if ($z >= $x && $z >= $y && $z >= $w);
    return $w;
}
