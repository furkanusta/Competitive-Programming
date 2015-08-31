#
# Codeforces
# Title: Coder
# URL  : http://codeforces.com/problemset/problem/384/A
#
use strict;
use warnings;

my $n = int<>;
my $str = "C." x int($n/2) . "C" x ($n%2);
my $str2 = ".C" x int($n/2) . "." x ($n%2);
my $pr = $str . "\n" . $str2 . "\n";
print $n * int($n / 2) + (int($n/2)+1)*($n%2) . "\n";
print $pr x int($n/2) . $str x ($n % 2) . "\n";
