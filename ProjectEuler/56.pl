#
# Project Euler
# Title: Powerful Digit Sum
# URL  : https://projecteuler.net/problem=56
#
# Again it is slow, I need to work on my Perl implementations
#
use strict;
use warnings;
use Math::BigInt;
my $product = Math::BigInt->new(0);
my $sum = 0;
my $max = 0;
for (my $a = Math::BigInt->new(1); $a < 100; $a++) {
    # print "a ", $a, "\n";
    $product = $a->copy();
    for (my $b = 0; $b < 100; $b++) {
        $product = $a->copy();
        $product->bpow($b);
        # print $product,"\n";
        $sum = 0;
        foreach (split //, $product->bstr()) {
            $sum += $_;
        }
        if ($sum > $max) {
            $max = $sum;
        }
    }
}
print $max, "\n";
# Answer: 972
