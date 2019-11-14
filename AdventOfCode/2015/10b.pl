# Same code as 10a.pl only the loop range has changed
use strict;
use warnings;
use autodie;
use Data::Dumper;
use v5.10; # for say

my $input = "3113322113";

for (1..50) {
    my $str = '';
    my $old = substr($input, 0, 1);
    my $count = 0;
    for my $ch(split //, $input) {
        # say "| $ch | $old | $count | $str |";
        if ($ch eq $old) {
            $count++;
        } else {
            $str .= $count . $old;
            $count = 1;
        }
        $old = $ch;
    }
    $input = $str . $count . substr($input, -1);
}
say length $input;
