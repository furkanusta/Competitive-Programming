#
# Codeforces
# Title: Word
# URL  : http://codeforces.com/problemset/problem/59/A
#
use strict;
use warnings;
my $str = <>;
my $result = () = $str =~ m/\p{Uppercase}/g;
$result-- while($str =~ m/\p{Lowercase}/g);
print ($result > 0 ? uc $str : lc $str);
