use strict;
use warnings;
use autodie;
use v5.10; # for say
use List::MoreUtils qw(natatime);


open (my $file, '<', '3.inp');
chomp(my $inp = <$file>);
my %seen;
my @x = (0, 0);
my @y = (0, 0);
$seen{"0:0"} = 1;               # Initial location is included
my $it = natatime 2, split('', $inp);
while (my @pair = $it->()) {
    for (0..1) {
        my $ch = $pair[$_];
        if ($ch eq '^') {
            $x[$_]++;
        } elsif ($ch eq '>') {
            $y[$_]++;
        } elsif ($ch eq '<') {
            $y[$_]--;
        } elsif ($ch eq 'v') {
            $x[$_]--;
        } else {
            die "Invalid Char";
        }
        $seen{"$x[$_]:$y[$_]"} = 1;
    }
}
say scalar keys %seen;
