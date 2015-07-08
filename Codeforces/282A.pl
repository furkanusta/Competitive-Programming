#
# Codeforces
# Title: Bit++
# URL  : http://codeforces.com/problemset/problem/282/A
#
use strict;
use warnings;
my $n = <>;
my $ans = 0;
my $str;
for (1..$n) {
    $str = <>;
    chomp $str;
    $ans++ if ($str eq "++X" || $str eq "X++");
    $ans-- if ($str eq "--X" || $str eq "X--");
}
print $ans . "\n";
