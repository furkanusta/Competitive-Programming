#
# Project Euler
# Title: Prime Permutations
# URL : https://projecteuler.net/problem=49
#
# In the example difference between numbers is 3330.
# However, there is no such a limitation in the question. Be careful!
#
use strict;
use warnings;
use Math::Prime::Util ':all';
my @primes = @{Math::Prime::Util::primes(1000, 9999)};
my $flag;
my $length = scalar @primes;
my $temp;

sub is_permutation {
    my $n = shift @_;
    my @arr = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    while ($n > 0) {
        $arr[$n % 10]++;
        $n = int($n / 10);
    }
    $n = shift @_;
    while ($n > 0) {
        $arr[$n % 10]--;
        $n = int($n / 10);
    }
    foreach (@arr) {
        return 0 if ($_ != 0);
    }
    return 1;
}

for (my $i = 0; $i < $length;$i++) {
    for my $j (0..($i - 1)) {
        $temp = $primes[$i] + $primes[$i] - $primes[$j];
        next if ($temp > 9999 || Math::Prime::Util::is_prime($temp) == 0 ||
                     is_permutation($primes[$i], $primes[$j]) == 0 || is_permutation($primes[$i], $temp) == 0);
        print join "", ($primes[$j], $primes[$i], $temp), "\n";
    }
}
# Answer: 2969629996294
