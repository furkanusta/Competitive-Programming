#
# Project Euler
# Title: Permuted Multiples
# URL  : https://projecteuler.net/problem=52
#
use strict;
use warnings;

my $found = 0;
my $cound = 1;
my $start = 1;
my $end  = 1;
my $flag = 0;

sub isPerm {

    my $N = shift @_;
    my $M = shift @_;

    my @arr = (0) x 10;

    while ($N) {
        $arr[$N % 10]++;
        $N = int($N  / 10);
    }
    while ($M) {
        $arr[$M % 10]--;
        $M = int($M / 10);
    }
    foreach(@arr) {
        if ($_ != 0) {
            return 0;
        }
    }
    return 1;
}

while (!$found) {
    $start *= 10;
    $end = int ($start * 10 / 6);
    for my $i ($start..$end) {
        $flag = 1;
        for my $j (2..6) {
            if (!isPerm($i, $i * $j)) {
                $flag = 0;
                last;
            }
        }
        if ($flag) {
            $found = 1;
            print $i, "\n";
            last;
        }
    }
}
# Answer: 142857
