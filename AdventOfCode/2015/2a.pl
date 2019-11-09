use strict;
use warnings;
use autodie;
use v5.10; # for say
use List::Util qw(min);


open (my $file, '<', '2.inp');
my $total = 0;
while (<$file>) {
    chomp;
    my ($w, $h, $l) = map {int} split 'x';
    my $wh = $w * $h;
    my $wl = $w * $l;
    my $hl = $h * $l;
    my $area = 2 * ($wh + $wl + $hl);
    my $smallest = min ($wh, $wl, $hl);
    $total += $area + $smallest;
}
say $total;
