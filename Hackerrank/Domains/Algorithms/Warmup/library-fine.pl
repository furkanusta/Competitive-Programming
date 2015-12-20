#
# Title: Library Fine
# URL: https://www.hackerrank.com/challenges/library-fine
# Difficulty: Easy
#
use strict;
use warnings;

my @time1 = split / /, <>;
my @time2 = split / /, <>;
my $fine = 0;

$time1[$_] -= $time2[$_] for(0..2);
if ($time1[2] >= 0) {
    $fine = 15 * $time1[0]  if ($time1[0] > 0 && $time1[1] == 0);
    $fine = 500 * $time1[1] if ($time1[1] > 0);
    $fine = 10000 if ($time1[2] > 0);
}
print $fine;
