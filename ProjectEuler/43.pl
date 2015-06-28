#
# Project Euler
# Title: Sub-string Divisibility
# URL  : https://projecteuler.net/problem=43
#
# I wrote brute force, however this could also be done my just pen and
# paper easily. Check: http://www.mathblog.dk/project-euler-43-pandigital-numbers-sub-string-divisibility/
#
use strict;
use warnings;
use Algorithm::Permute;
use Math::Prime::FastSieve;
use Math::BigInt;
my @array = qw(1 0 2 3 4 5 6 7 8 9);
my $ans = Math::BigInt->new(0);
my $p_iterator = Algorithm::Permute->new(\@array);
my @primes = (2, 3, 5, 7, 11, 13, 17);
my $flag = 1;
my @perm = ();
while (@perm = $p_iterator->next) {
    next if ($perm[$#perm] == 0);
    $flag = 1;
    for (my $i = 1; $i < 8; $i++) {    # 234 to 8910
        if (int(join "", @perm[$i..($i+2)]) % $primes[$i - 1] != 0) {
            $flag = 0;
            last;
        }
    }
    if ($flag == 1) {
        $ans += Math::BigInt->new(join "", @perm);
        print Math::BigInt->new(join "", @perm), "\n";
    }
}
print $ans, "\n";

# Answer: 16695334890
