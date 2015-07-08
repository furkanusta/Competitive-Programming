# Fuck, I love Perl.
#
# Codeforces
# Title: Anton and Letters
# URL  : http://codeforces.com/problemset/problem/443/A
#
# In the regexp we remove first and last charaters {}
#   I've also added \n at the end of the regexp instead of doing chomp
# Then split the chopped string and put them into hash to remove duplicate
#
use strict;
use warnings;
my $str = <>;
$str =~ s/{([^{}]*)}\n/$1/;
my %hash = map { $_, 1 } split ", ", $str;
print scalar keys %hash;

=begin comment
In my computer code below works. However, Codeforces did not accept it,
    so I've changed it a bit

my %hash = map { $_, 1 } split ", ", <> =~ s/{([^{}]*)}\n/$1/r;
print scalar keys %hash;

=end comment
