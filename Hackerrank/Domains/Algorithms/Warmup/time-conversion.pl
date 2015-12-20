#
# Title: Time Conversion
# URL: https://www.hackerrank.com/challenges/time-conversion
# Difficulty: Easy
#
use strict;
use warnings;
use Time::Piece;
print join(":", Time::Piece->strptime(<>,'%H:%M:%S %p') =~ /(..):(..):(..)/g);
