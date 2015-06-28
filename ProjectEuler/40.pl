# Project Euler
# Title: Champernowne's constant
# URL  : https://projecteuler.net/problem=40
#
# This question can also be solved with pen and paper easily
#
use strict;
use warnings;
use integer; # For integer Division
my @arr = (1, 10, 100, 1000, 10000, 100_000, 1_000_000);
my $length = scalar @arr - 1;
my $count = 0;
my $ans = 1;
my @temp;
my $j = 0;
for (my $i = 1; $j < $length; $i++) {
    @temp = split(//,$i);
    while (scalar @temp > 0) {
        $count++;
        if ($count == $arr[$j]) {
            $ans *= shift @temp;
            $j++;
        }
        else {
            shift @temp;
        }
    }
}
print $ans, "\n";
# Answer: 210
