#
# Project Euler
# Title: Lychrel Numbers
# URL: https://projecteuler.net/problem=55
#
# Code is really slow, it could be because of BigInt but I couldn't find any
# other way except string addition.
#

use strict;
use warnings;
use Math::BigInt;
my $num;
my $ans = 0;

for my $i(1..9999) {
    $num = Math::BigInt->new($i);
    if ($num eq reverse $num) {
        $ans++;
    }
    else {
        for (1..50) {
            $num = $num + reverse $num;
            if ($num eq reverse $num) { # Palindrome check
                $ans++;
                last;
            }
        }
    }
}
print 9999 - $ans, "\n";
# Answer: 249
