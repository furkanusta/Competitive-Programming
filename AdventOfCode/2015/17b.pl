# Same as 17a but in 2D. second dimension holds the number of containers used.
use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;

open (my $file, '<', '17.inp');

my $limit = 150;
my @container;
while (<$file>) {
    chomp;
    push @container, $_;
}

my @dp;
push @dp, [(0) x 151] for(0..150);
$dp[0][0] = 1;
for my $i (@container) {
    for (my $j=$limit - 1; $j >= 0; $j--) {
        for my $k (0..150) {
            if ($dp[$j][$k] && $i + $j <= $limit) {
                $dp[$i + $j][$k + 1] += $dp[$j][$k];
            }
        }
    }
}

for my $k(0..150) {
    if ($dp[150][$k]) {
        say $dp[150][$k];
        last;
    }
}
