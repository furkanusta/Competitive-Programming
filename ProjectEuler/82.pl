#
# Project Euler
# Title: Path Sum: Three Ways
# URL  : https://projecteuler.net/problem=82
#
use strict;
use warnings;

open(my $file, "<", "p082_matrix.txt") or die "DIE: $!";
my $n = 79;
my @ans;
my @matrix;
my $ans = 1e10;
$matrix[$. - 1] = [split /,/, $_] while($_ = <$file>);

$ans[$_] = $matrix[$_][$n] for (0..$n);

for (my $i = $n - 1; $i >= 0; $i--) {
    $ans[0] += $matrix[0][$i];

    for my $j(1..$n) {
        $ans[$j] = min($ans[$j - 1] + $matrix[$j][$i], $ans[$j] + $matrix[$j][$i]);
    }
    for(my $j = $n - 1; $j >= 0; $j--) {
        $ans[$j] = min($ans[$j], $ans[$j + 1] + $matrix[$j][$i]);
    }
}

$ans = min($ans, $ans[$_]) for(0..$n);
print "$ans\n";

sub min {
    my ($a, $b) = (shift, shift);
    return $a if($a < $b);
    return $b;
}
# Answer: 260324
