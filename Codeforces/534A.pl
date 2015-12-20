#
# Codeforces
# Title: Exam
# URL  : http://codeforces.com/problemset/problem/534/A
#
use strict;
use warnings;

my $n = int<>;

if ($n >= 5) {
    print "$n\n";
    print join ' ', map {2 * $_ - 1} (1..int(($n+1)/2));
    print ' ';
    print join ' ', map {2 * $_} (1..int(($n)/2));
} else {
    if ($n == 4) {
        print "4\n3 1 4 2";
    } elsif ($n == 3) {
        print "2\n1 3";
    } else {
        print "1\n1";
    }
}
