# Brute Force takes around ~10sec
use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;


my $inp = 34000000;
my $length = int($inp / 11);
my @houses;
my $ans = -1;

outer:
for my $i(1..$length) {
    for (my ($j, $k) = ($i, 0); $j <= $length && $k <= 50; $j += $i, $k++) {
        $houses[$j] += $i;
        $ans = ($ans == -1 || $j < $ans) ? $j : $ans if ($houses[$j] >= $length);
    }
}

say $ans;
say $houses[$ans];
