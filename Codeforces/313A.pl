#
# Codeforces
# Title: Ilya and Bank Account
# URL  : http://codeforces.com/problemset/problem/313/A
#
use strict;
use warnings;

my $n = int<>;

if ($n >= 0) {
    print $n . "\n";
}
else {
    if (-$n % 10 > int(-$n % 100 / 10)) {
        print int $n / 10;
    }
    else {
        print -int(-$n / 100) * 10 - (-$n % 10);
    }
}
