use strict;
use warnings;
use autodie;
use v5.10; # for say
use List::Util qw(max);


open (my $file, '<', '2.inp');
my $total = 0;
while (<$file>) {
    chomp;
    my ($w, $h, $l) = map {int} split 'x';
    my $volume = $w * $h * $l;
    my $perimeter = 2 * ($w + $h + $l - max ($w, $h, $l));
    $total += $volume + $perimeter;
}
say $total;
