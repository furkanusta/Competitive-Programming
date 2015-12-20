#
# Project Euler
# Title: Concealed Square
# URL  : https://projecteuler.net/problem=206
#
use strict;
use warnings;
# sqrt(1929394959697989990);
my $regex = qr/1[0-9]2[0-9]3[0-9]4[0-9]5[0-9]6[0-9]7[0-9]8[0-9]9/o;
for (my $i = 138902663; $i > 0; $i -= 2) {
    if ((($i * $i) . "" ) =~ $regex) {
        CORE::say $i * 10;
        last;
    }
}

