#
# Project Euler
# Title: Path sum: Two Ways
# URL  : https://projecteuler.net/problem=81
#
use strict;
use warnings;

open(my $file, "<", "p081_matrix.txt") or die "Not Found: $!";
my @matrix;
my @ans;
$matrix[$. - 1] = [split /,/, $_] while($_ = <$file>);
$ans[0][0] = $matrix[0][0];
for(1..79) {
    $ans[$_][0] = $ans[$_ - 1][0] + $matrix[$_][0];
    $ans[0][$_] = $ans[0][$_ - 1] + $matrix[0][$_];
}
for my $i(1..79) {
    for my $j(1..79) {
        $ans[$i][$j] = min($ans[$i - 1][$j], $ans[$i][$j - 1]) + $matrix[$i][$j];
    }
}
sub min {
    my ($a, $b) = (shift @_, shift @_);
    return $a if($a < $b);
    return $b;
}
print $ans[79][79];

# Answer: 427337
