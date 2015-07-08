#
# Codeforces
# Title: String Task
# URL  : http://codeforces.com/problemset/problem/118/A
#
use strict;
use warnings;
my $str = <>;
chomp $str;
$str =~ s/[aeiouy]//ig;		# Vovels
$str =~ s/([^aeiouy])/.$1/ig;   # Consonants
print lc($str) . "\n";		# lc for lowercase
