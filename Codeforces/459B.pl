#
# Codeforces
# Title: Pashmak and Flowers
# URL  : http://codeforces.com/problemset/problem/459/B
#
use strict;
use warnings;

my $n = <>;
my @arr = split / /, <>;
my ($min, $max) = (10**9, 0);
my ($ans, $cmin, $cmax) = (0, 0, 0);
for (@arr) {
    if ($_ > $max) {
        $max = $_;
        $cmax = 0;
    }
    if ($_ < $min) {
        $min = $_;
        $cmin = 0;
    }
    $cmax++ if ($_ == $max);
    $cmin++ if ($_ == $min);
}
$ans = $cmax * $cmin;
$ans = ($n * ($n - 1)) / 2 if($max == $min);
print $max - $min . " " . $ans . "\n";
