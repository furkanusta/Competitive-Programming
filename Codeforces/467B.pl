#
# Codeforces
# Title: Fedor and New Game
# URL  : http://codeforces.com/problemset/problem/467/B
#
use strict;
use warnings;

sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    $str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    return $str;
}

my @arr;
my ($n, $m, $k) = split / /, <>;
my ($count, $ans) = (0, 0);
for my $i(0..$m) {
    chomp($_ = <>);
    push @arr, $_;
}
for my $i(0..$m-1) {
    $count = dec2bin(int$arr[$i] ^ int$arr[-1]) =~ tr/1/1/;
    $ans++ if ($count <= $k);
}
print $ans . "\n";
