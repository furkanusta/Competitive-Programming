#
# Title: The Time In Words
# URL: https://www.hackerrank.com/challenges/the-time-in-words
# Difficulty: Moderate
#
use strict;
use warnings;

my @mins = ("", "one minute","two minutes","three minutes","four minutes","five minutes","six minutes","seven minutes","eight minutes","nine minutes","ten minutes","eleven minutes","twelve minutes","thirteen minutes","fourteen minutes","quarter","sixteen minutes","seventeen minutes","eighteen minutes","nineteen minutes","twenty minutes","twenty one minutes","twenty two minutes","twenty three minutes","twenty four minutes","twenty five minutes","twenty six minutes","twenty seven minutes","twenty eight minutes","twenty nine minutes","half");

my @hours = ("", "one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","one");
my $h = int<>;
my $m = int<>;
my $ans = "$hours[$h] o' clock";
$ans = "$mins[$m] past $hours[$h]" if ($m > 0 && $m <= 30);
$ans =  "$mins[60-$m] to $hours[$h + 1]" if ($m > 30);
print $ans;
