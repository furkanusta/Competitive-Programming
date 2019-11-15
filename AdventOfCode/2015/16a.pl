use strict;
use warnings;
use autodie;
use v5.10; # for say


open (my $file, '<', '16.inp');

my %hints = (
  'children' => 3,
  'cats' => 7,
  'samoyeds' => 2,
  'pomeranians' => 3,
  'akitas' => 0,
  'vizslas' => 0,
  'goldfish' => 5,
  'trees' => 3,
  'cars' => 2,
  'perfumes' => 1,
);

my %aunts;
my $ans;
while (<$file>) {
    chomp;
    /Sue (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/;
    next unless $hints{$2} == $3;
    next unless $hints{$4} == $5;
    next unless $hints{$6} == $7;
    $ans = $1;
    last;
}
say $ans;
