#
# Codeforces
# Title: I wanna Be the Guy
# URL  : http://codeforces.com/problemset/problem/469/A
#
use strict;
use warnings;

my $n = <>;
my ($na, @a) = split " ", <>;
my ($nb, @b) = split " ", <>;
push @a, @b;
my %k = ();
$k{$_} = 1 foreach(@b);
print scalar keys %k == $n? "I become the guy.\n" : "Oh, my keyboard!\n";
