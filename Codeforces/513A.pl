#
# Codeforces
# Title: Game
# URL  : http://codeforces.com/problemset/problem/513/A
#
use strict;
use warnings;
my ($n1, $n2) = split / /, <>;
my $ans = "Second";
$ans = "First" if ($n1 > $n2);
print $ans;
