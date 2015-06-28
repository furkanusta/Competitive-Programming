#
# Project Euler
# Title: Pentagon Numbers
# URL  : https://projecteuler.net/problem=44
#
# It is working really slow, I don't know why maybe there is a small bug in the code 
# or maybe it is something related to Perl
#
use strict;
use warnings;

sub isPentagonal { # Other way could be precalculating and storing the pentagonal numbers
    my $N = shift @_;
    my $num = (sqrt(1 + 24 * $N) + 1) / 6;
    return $num == int($num);
}
my $n = 0;
my $m = 0;
OUTER:
for (my $i = 2; ; $i++) {
    $n = $i * (3 * $i - 1) / 2;
    for (my $j = $i - 1; $j > 0; $j--) {
        $m = $j * (3 * $j - 1) / 2;
        if (isPentagonal($n + $m) && isPentagonal($n - $m)) {
            print $n - $m, "\n";
            last OUTER;
        }
    }
} # Answer: 5482660
