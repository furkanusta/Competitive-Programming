#
# Codeforces
# Title: Playing with Paper
# URL  : http://codeforces.com/problemset/problem/527/A
#
use strict;
use warnings;

my ($a, $b) = split / /, <>;
($a, $b) = ($b, $a) if($b > $a);
my $ans = 0;
while($b) {
    $ans += int($a / $b);
    ($a, $b) = ($b, $a % $b);
}
print $ans . "\n";
