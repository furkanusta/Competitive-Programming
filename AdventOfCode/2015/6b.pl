# Quite inefficient, something like a segment tree could be more sophisticated.
# or even using set operations instead of flipping one by one would be quite an improvement.
use strict;
use warnings;
use autodie;
use v5.10; # for say

open (my $file, '<', '6.inp');

my @grid;
push @grid, [(0) x 1000] for 0..999;
while (<$file>) {
    chomp;
    /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/;
    for my $i($2..$4) {
        for my $j($3..$5) {
            if ($1 eq 'turn on') {
                $grid[$i][$j] += 1;
            } elsif ($1 eq 'turn off') {
                $grid[$i][$j] -= 1 if $grid[$i][$j];
            } elsif ($1 eq 'toggle') {
                $grid[$i][$j] += 2;
            } else {
                die "Invalid";
            }
        }
    }
}

my $counter = 0;
for my $i(0..999) {
    for my $j(0..999) {
        $counter += $grid[$i][$j];
    }
}
say $counter;
