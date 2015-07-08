#
# Project Euler
# Title: Powerful Digit Counts
# URL  : https://projecteuler.net/problem=63
#
# Check here for a mathematical explanation:
#     http://www.mathblog.dk/project-euler-63-n-digit-nth-power/
use strict;
use warnings;
use POSIX;    # for ceil method 
my $ans = 0;
my $lower = 0;
my $i = 1;
for (; $lower < 10; $i++, $ans += 10 - $lower) {
    $lower = int(ceil(10**(($i - 1) / $i)));
}
print $ans, "\n";
# Answer: 49
