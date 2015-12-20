#
# Codeforces
# Title: Arrays
# URL  : http://codeforces.com/problemset/problem/572/A
#
use strict;
use warnings;

my ($na, $nb) = split / /, <>;
my ($k, $m) = split / /, <>;
my @a = split / /, <>;
my @b = split / /, <>;

if ($a[$k - 1] < $b[-$m]) {
    print "YES\n";
}
else {
    print "NO\n";
}
