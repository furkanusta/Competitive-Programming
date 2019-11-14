use strict;
use warnings;
use autodie;
use v5.10; # for say
use List::Util qw(max);
use Data::Dumper;


open (my $file, '<', '14.inp');

my %deers;
while (<$file>) {
    use integer;
    chomp;
    /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./;
    my $name = $1;
    my $speed = $2;
    my $duration = $3;
    my $rest = $4;
    $deers{$name} = [$speed, $duration, $rest];
}

my %distances;
my %golds;
for(keys %deers) {
    $distances{$_} = 0;
    $golds{$_} = 0;
}

my $end_time = 2503;
my $time = 0;
while($time < $end_time) {
    for(keys %deers) {
        my ($speed, $duration, $rest) = @{$deers{$_}};
        my $cycle = $duration + $rest;
        my $tm = $time % $cycle;
        if ($tm < $duration) {
            $distances{$_} += $speed;
        }
    }
    my $max = 0;
    my $idx = 0;
    my @extras;
    for(keys %distances) {
        if ($distances{$_} > $max) {
            $max = $distances{$_};
            $idx = $_;
            @extras = ();
        } elsif ($distances{$_} == $max) {
            push @extras, $_;
        }
    }
    $golds{$idx}++;
    $golds{$_}++ foreach(@extras);
    $time++;
}
say max values %golds;
