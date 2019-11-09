use strict;
use warnings;
use autodie;
use v5.10; # for say

open(my $file, '<', '1.inp');
chomp(my $line = <$file>);
my $floor = 0;
my @chars = split('', $line);
while (my ($idx, $char) = each @chars) {
    if ($char eq '(') {
        $floor++;
    } elsif ($char eq ')') {
        $floor--;
    } else {
        die "Invalid Char";
    }
    if ($floor < 0) {
        # each starts from 0
        say $idx + 1;
        last;
    }
}
