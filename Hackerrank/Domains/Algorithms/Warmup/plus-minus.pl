#
# Title: Plus Minus
# URL: https://www.hackerrank.com/challenges/plus-minus
# Difficulty: Easy
#
use strict;
use warnings;

my $n = int<>;
my ($neg, $pos, $zero) = (0, 0, 0);

for(split / /, <>) {
    $zero++ if (int$_ == 0);
    $neg++  if (int$_ < 0);
    $pos++  if (int$_ > 0);
}
print sprintf("%.3f", $pos / $n) . "\n";
print sprintf("%.3f", $neg / $n) . "\n";
print sprintf("%.3f", $zero / $n) . "\n";
