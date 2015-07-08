#
# Project Euler
# Title: Poker Hands
# URL  : https://projecteuler.net/problem=54
#
use strict;
use warnings;

sub isRoyal {
    my @arr = shift @_;
    my @ccc;
    $ccc[$arr[0][0]]++;
    for my $i (1..4) {
        if ($arr[$i][1] != $arr[$i - 1][$1]) {
            return 0;
        }
        $ccc[$arr[$i][0]]++;
    }
    return 1;
}
sub isStraightFlush {
    my @arr = shift @_;
}
sub isFour {
    my @arr = shift @_;
}
sub isFull {
    my @arr = shift @_;
}
sub isStraight {
    my @arr = shift @_;
}
sub isFlush {
    my @arr = shift @_;
}
sub isThree {
    my @arr = shift @_;
}
sub isTwo {
    my @arr = shift @_;
}
sub isOne {
    my @arr = shift @_;
}
sub high {
    my @arr = shift @_;
}
open(my $in, "<:encoding(UTF-8)", "p054_poker.txt")
  or die "Could not open file!";
my $line;
my @array;
my @p1;
my @p2;
my $ans = 0;
my $c1;
my $c2;
my @count = (\&isRoyal, \&isStraightFlush, \&isFour, \&isFull, \&Straight, \&isFlush, \&isThree, \&isTwo, \&isOne, \&high);
for (1..1000) {
    $line = <$in>;
    chomp $line;
    @array = split " ", $line;
    @p1 = sort @array[0..4];
    @p2 = sort @array[5..9];
    print "@p1 @p2\n";
    # for my $i (0..8) {
    #     $c1 = $count[$i]->[@p1];
    #     last if ($c1);
    # }
    # for my $i (0..9) {
    #     $c2 = $count[$i]->[@p2];
    #     last if ($c2);
    # }
    # $ans++ if ($c1 > $c2);
}
print $ans, "\n";
