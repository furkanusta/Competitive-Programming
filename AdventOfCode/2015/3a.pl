use strict;
use warnings;
use autodie;
use v5.10; # for say


open (my $file, '<', '3.inp');
chomp(my $inp = <$file>);
my %seen;
my $x = 0;
my $y = 0;
$seen{"0:0"} = 1; # Initial location is included
for my $ch (split '', $inp) {
    if ($ch eq '^') {
        $x++;
    } elsif ($ch eq '>') {
        $y++;
    } elsif ($ch eq '<') {
        $y--;
    } elsif ($ch eq 'v') {
        $x--;
    } else {
        die "Invalid Char";
    }
    $seen{"$x:$y"} = 1; # We could've used a 2D hash $seen{$x}{$y} but this works and easier to count keys.
}
say scalar keys %seen;
