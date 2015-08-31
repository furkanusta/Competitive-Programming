#
# Codeforces
# Title: Jzzhu and Children
# URL  : http://codeforces.com/problemset/problem/450/A
#
# Line before the last we are making a 2D-array with [num, index+1]
#   and in the last line we are sorting the array according to the value ceil(arr[i]/m)
# - in the sort function is to make the sort in descending order. Instead of reversing it
# and the part after || is to be sure that in equal entries the one appears later will be our answer
# 

use strict;
use warnings;
my ($n, $m) = split / /, <>;
my @arr = split / /, <>;
$arr[$_] = [$arr[$_], $_+1] for(0..$#arr);
print ((sort{-(int(($a->[0]+$m-1)/$m) <=> int(($b->[0]+$m-1)/$m) || $a->[1] <=> $b->[1])} @arr)[0]->[1]);
