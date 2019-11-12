use strict;
use warnings;
use autodie;
use v5.10; # for say


open(my $file, '<', '8.inp');
my $total = 0;
while(<$file>) {
    chomp;
    $total += length;
    say $_ . " " . length;
    s/\s//g;
    s/(\\\\|\\"|\\x..)/./g;
    say $_ . " " . length;
    $total -= length;
    $total += 2; # For enclosing quotes
}
say $total;
