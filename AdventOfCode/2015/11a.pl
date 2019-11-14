use strict;
use warnings;
use autodie;
use v5.10; # for say


my $input = 'cqjxjnds';


while(1) {
    ++$input;
    if ($input =~ /i|o|l/) {
        next;
    }
    if (!($input =~ /(.)\1.*(.)\2/)) {
        next;
    }
    my @arr = split //, $input;
    my $match = 0;
    for (0..$#arr-2) {
        my $first = ord($arr[$_]);
        my $second = ord($arr[$_ + 1]);
        my $third = ord($arr[$_ + 2]);
        if ($third - $second == 1 and $second - $first == 1) {
            $match = 1;
            last;
        }
    }
    last if $match;
}
say $input;
