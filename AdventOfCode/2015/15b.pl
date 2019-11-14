# This is an optimization problem, could be a dynamic programming solution but I don't want to look
# for that right now, hence a generalized bruteforce implementation.
use strict;
use warnings;
use autodie;
use v5.10; # for say
use List::Util qw(max);
use Storable qw(dclone);
use Data::Dumper;

open (my $file, '<', '15.inp');

my $max = 0;
my @ans;

sub rec {
    my ($rem, $index, $usage, $weights) = @_;
    if ($index == scalar @{$usage}) {
        if ($rem) {
            return;
        }
        my @keys = keys %{$weights};
        my $cap = 0;
        my $dur = 0;
        my $fla = 0;
        my $tex = 0;
        my $cal = 0;
        for (0..$#keys) {
            my ($capacity, $durability, $flavor, $texture, $calories) = @{$weights->{$keys[$_]}};
            $cap += $usage->[$_] * $capacity;
            $dur += $usage->[$_] * $durability;
            $fla += $usage->[$_] * $flavor;
            $tex += $usage->[$_] * $texture;
            $cal += $usage->[$_] * $calories;
        }
        $cap = 0 if $cap < 0;
        $dur = 0 if $dur < 0;
        $fla = 0 if $fla < 0;
        $tex = 0 if $tex < 0;
        if ($cal != 500) {
            return;
        }
        my $total = $cap * $dur * $fla * $tex;
        if ($total > $max) {
            $max = $total;
            @ans = dclone($usage);
        }
        return;
    }
    for (0..$rem) {
        $usage->[$index] = $_;
        rec($rem - $_, $index + 1, $usage, $weights);
    }
};

my %weights;
while (<$file>) {
    chomp;
    /(\w+): capacity ([-0-9]+), durability ([-0-9]+), flavor ([-0-9]+), texture ([-0-9]+), calories ([-0-9]+)/;
    my ($name, $capacity, $durability, $flavor, $texture, $calories) = ($1, $2, $3, $4, $5, $6);
    $weights{$name} = [$capacity, $durability, $flavor, $texture, $calories];
}

my @usage;
push @usage, 0 for(keys %weights);
rec(100, 0, \@usage, \%weights);
say $max;
