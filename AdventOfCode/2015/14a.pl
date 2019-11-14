use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;


sub min {
    my ($a, $b) = @_;
    return $a < $b ? $a : $b;
};

sub max {
    my ($a, $b) = @_;
    return $a > $b ? $a : $b;
};

open (my $file, '<', '14.inp');

my $end_time = 2503;
my $answer = 0;
while (<$file>) {
    use integer;
    chomp;
    /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./;
    my $name = $1;
    my $speed = $2;
    my $duration = $3;
    my $rest = $4;
    my $cycle = $duration + $rest;
    my $distance = 0;
    my $time = $end_time;
    if ($cycle < $time) {
        my $laps = $time / $cycle;
        $distance += $laps * $duration * $speed;
        $time -= $laps * $cycle;
    }
    $distance += $speed * min($duration, $time);
    $answer = max($distance, $answer);
}
say $answer;
