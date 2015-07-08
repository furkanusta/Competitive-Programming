#
# Project Euler
# Title: Square Digit Chains
# URL  : https://projecteuler.net/problem=92
#
# It is unbelievably slow and gives warning; however, I will not
# try to improve it, I am sorry. For a more feasible solution:
# http://www.mathblog.dk/project-euler-92-square-digits-number-chain/
#
use strict;
use warnings;

my $num;
my $temp;
my $ans = 0;
my @array = (-1) x 10_000_000;

sub rec {
    my $N = shift @_;
    return $array[$N] if ($array[$N] != -1);
    return 1 if ($N == 89);
    return 0 if ($N == 1);

    $temp = $N;
    $N = 0;
    while ($temp > 0) {
        $N += ($temp % 10) * ($temp % 10);
        $temp = int($temp / 10);
    }
    return $array[$N] = rec($N);
}
$ans += rec($_) for (1..10_000_000);
print $ans, "\n";
# Answer: 8581146
