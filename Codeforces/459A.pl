#
# Codeforces
# Title: Pashmak and Garden
# URL  : http://codeforces.com/problemset/problem/459/A
#
use strict;
use warnings;

my ($x1, $y1, $x2, $y2) = split / /, <>;
if ($x1 != $x2 && $y1 != $y2) {
    if (abs($x2 - $x1) != abs($y2 - $y1)) {
        print -1 . "\n";
    }
    else {
        print "$x2 $y1 $x1 $y2";
    }
}
else {
    if ($x1 == $x2) {
        print (($x1 + abs($y2 - $y1)) . " " . $y1 . " ");
        print (($x2 + abs($y2 - $y1)) . " " . $y2);     # \n does not needed because we didn't chomp $y2
    }
    else {
        print $x1 . " " . ($y1 + abs($x2 - $x1)) . " ";
        print $x2 . " " . ($y2 + abs($x2 - $x1)) . "\n";
    }
}
