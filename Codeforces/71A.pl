#
# Codeforces
# Title: Way Too Long Words
# URL  : http://codeforces.com/problemset/problem/71/A
#
use strict;
use warnings;

my $n = <>;
my $str;
my @arr;
for(1..$n) {
    $str = <>;
    chomp $str;
    @arr = split "", $str;
    $str =  $arr[0] . (scalar @arr-2) . $arr[-1] if (scalar @arr > 10);
    print $str . "\n";
}
