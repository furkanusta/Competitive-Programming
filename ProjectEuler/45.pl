#
# Project Euler
# Title: Triangular, Pentagonal and Hexagonal
# URL  : https://projecteuler.net/problem=45
#
# All hexagonal numbers are subset of triangular numbers.
#
use strict;
use warnings;
my $n = 0;

sub isPentagonal { # Other way could be precalculating and storing the pentagonal numbers
    my $N = shift @_;
    my $num = (sqrt(1 + 24 * $N) + 1) / 6;
    return $num == int($num);
}

for (my $i = 287; ; $i += 2) {	# Question asks for the next number after 285
    $n = $i * ($i + 1) / 2;
    if (isPentagonal($n)) {
        print $n, "\n";
        last;
    }
}
# Answer: 1533776805
