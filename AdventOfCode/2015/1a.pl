use strict;
use warnings;
use v5.10;

open(my $file, '<', '1.inp');
while(<$file>) {
    chomp;
    my $up = () = $_ =~ /\(/g;
    my $down = () = $_ =~ /\)/g;
    say ($up - $down);
}
