use strict;
use warnings;
use autodie;
use v5.10; # for say


open(my $file, '<', '8.inp');
my $total = 0;
while(<$file>) {
    chomp;
    $total -= length;
    my $quoted = quotemeta;
    $total += length $quoted;
    $total += 2; # For surrounding quotes
}
say $total;
