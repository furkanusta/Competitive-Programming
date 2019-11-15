# Knapsack problem
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

my @dp = (0) x 151;
$dp[0] = 1;
for my $i(@container) {
    for my $j(reverse 0...$limit) {
        if ($dp[$j] && $i + $j <= $limit) {
            $dp[$i + $j] += $dp[$j];
        }
    }
}
say $dp[150];
