#
# Title: Angry Professor
# URL: https://www.hackerrank.com/challenges/angry-professor
# Difficulty: Easy
#
use strict;
use warnings;
for(1..int<>){
    my $k = (split / /, <>)[1];
    print ((scalar(grep {$_ <= 0} (split / /, <>)) >= $k) ? "YES\n" : "NO\n");
}
