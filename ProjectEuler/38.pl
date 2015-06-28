#
# Project Euler
# Title: Pandigital Number
# URL  : https://projecteuler.net/problem=38
#
# (1,2..n)[Given in the question]
# n is less than 5 otherwise a digit '0' appears which is not wanted
# Deeper analysis is here : http://www.mathblog.dk/project-euler-38-pandigital-multiplying-fixed-number/
# and that limits our candidates between 9234 and 9487
#
#
use strict;
use warnings;
use Math::BigInt;

sub isPan {
    my $k = $_[0];
    my $temp = 0;
    my $mark = 0;
    my $count = 0;
    while ($k > 0) {
        $mark |= 1 << ($k % 10 - 1);
        if ($temp == $mark) {
            return 0;
        }
        $k /= 10;
        $count++;
        $temp = $mark;
    }
    return $temp == ((1 << $count) - 1);
}

sub concat {
    my $a = Math::BigInt->new($_[0]);
    my $b = Math::BigInt->new($_[1]);
    my $c = Math::BigInt->new($b);
    while ($c > 0) {
        $a *= 10;
        $c /= 10;
    }
    return $a + $b;
}


my $sum = 0;
my $num = 0;
for (my $i = 9387; $i >= 9234; $i--) {
    $num = concat($i, 2 * $i);
    if (isPan($num)) {
        print $num, "\n";
        last;
    }
}

# Answer: 932718654
