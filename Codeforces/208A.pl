#
# Codeforces
# Title: Dubstep
# URL  : http://codeforces.com/problemset/problem/208/A
#
use strict;
use warnings;
my $str = "WUB" . <>;	# If I don't add "WUB" at both and and beginnin substr may work wrong
chomp $str;
$str .= "WUB";
$str =~ s/(WUB)+/ /g;
print substr($str, 1, length($str) - 2);

# There is also a one-line solution :
# s/WUB/ /g
