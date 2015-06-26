#
# Project Euler
# Title: Distinct Prime Factors
# URL: https://projecteuler.net/problem=47
#
# Pure brute-force
use strict;
use warnings;

my @primes;
my @factors;

sub findPrimes {
    my $N = shift @_;
    my @array;
    @array[1..$N] = 0;

    for my $i (2..$N) {
        if (!$array[$i]) {
            for (my $j = $i + $i; $j <= $N; $j += $i) {
                $array[$j] = 1;
            }
        }
    }
    for (my $i = 2; $i < scalar @array; $i++) {
        push(@primes,$i) if !$array[$i];
    }
}
sub check_factors {
    my $num = shift @_;
    my $length = scalar @primes;
    my $exp = 0;
    my $temp;
    for (my $i = 0; $i < $length; $i++) {
        if ($primes[$i] * $primes[$i] > $num) {
            return ++$exp;
        }
        $temp = $num;
        $exp += ($num % $primes[$i] == 0);
        while ($num % $primes[$i] == 0) {
            $num /= $primes[$i];
        }
        return $exp if $num == 1;
    }
    return $num;
}
findPrimes(100);

## Brute-Force part
my $target = 4;
my $found  = 0;
my $number = 210; # 210 = 2*3*5*7 least possible answer
for (; $found < $target; $number++) {
    if (check_factors($number) == 4) {
        $found++;
    }
    else {
        $found = 0;
    }
}
print $number - 4, "\n"; # When It breaks the loop it breaks the consective fourth.

#Answer: 134043

# Answer is correct, but program is very slow.
