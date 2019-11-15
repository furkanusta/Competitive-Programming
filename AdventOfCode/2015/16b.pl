use strict;
use warnings;
use autodie;
use v5.10; # for say

open (my $file, '<', '16.inp');

my %hints = (
  'children' => 3,
  'samoyeds' => 2,
  'akitas' => 0,
  'vizslas' => 0,
  'cars' => 2,
  'perfumes' => 1,
);
my %more = (
  'trees' => 3,
  'cats' => 7,
);
my %less = (
  'pomeranians' => 3,
  'goldfish' => 5,
);

my %aunts;
my $ans;
top: while (<$file>) {
    chomp;
    /Sue (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/;
    my %aunt = (
        "$2" => "$3",
        "$4" => "$5",
        "$6" => "$7",
    );
    for(keys %aunt) {
        if (exists $hints{$_} && $hints{$_} != $aunt{$_}) {
            next top;
        }
        if (exists $more{$_} && $more{$_} > $aunt{$_}) {
            next top;
        }
        if (exists $less{$_} && $less{$_} < $aunt{$_}) {
            next top;
        }
    }
    $ans = $1;
    last;
}
say $ans;
