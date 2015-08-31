#
# Project Euler
# Title: Largest Exponential
# URL  : https://projecteuler.net/problem=99
#
use strict;
use warnings;
open(my $file, "<", "p099_base_exp.txt") or die "Cannot open : $!";
my ($base, $exp, $max, $ans) = (0, 0, 0, 0);
while($_ = <$file>) {
    ($base, $exp) = split /,/, $_;
    if ($exp * log($base) > $max) {
        $max = $exp * log($base);
        $ans = $.;
    }
}
print $ans . "\n";

# Answer: 709
