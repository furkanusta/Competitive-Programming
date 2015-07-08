#
# Codeforces
# Title: Queue at the School
# URL  : http://codeforces.com/problemset/problem/266/B
#
use strict;
use warnings;
my ($n, $t) = split " ", <>;
my @str = split "", <>;
my $l = scalar @str;

for (1..$t) {
    for (my $i = 0; $i < $l; $i++) {
        if ($str[$i] eq 'B' && $str[$i + 1] eq 'G') {
            ($str[$i] , $str[$i + 1]) = ($str[$i + 1], $str[$i]);
            $i++;
        }
    }
}
print @str;
