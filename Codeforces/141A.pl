#
# Codeforces
# Title: Amusing Joke
# URL  : http://codeforces.com/problemset/problem/141/A
#
use strict;
use warnings;

my @arr = split "", <>;   pop @arr;
push @arr, split "", <>;  pop @arr;
my @match = split "", <>; pop @match;
my @letter = (0) x 30;
my $ans = "YES\n";

$letter[ord($_) - 65]++ foreach(@arr);
$letter[ord($_) - 65]-- foreach(@match);

foreach(@letter) {
    $ans = "NO\n" if($_ != 0);
}
print $ans;
