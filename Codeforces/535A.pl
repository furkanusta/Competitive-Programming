#
# Codeforces
# Title: Tavas and Nafas
# URL  : http://codeforces.com/problemset/problem/535/A
#
# Again, rsFalse.
# I love that guy's regex solutions
#
use strict;
use warnings;

my %h = qw(0 zero 10 ten 1 one 11 eleven 2 two 12 twelve 20 twenty 3 three 13 thirteen 30 thirty 4 four 14 fourteen 40 forty 5 five 15 fifteen 50 fifty 6 six 16 sixteen 60 sixty 7 seven 17 seventeen 70 seventy 8 eight 18 eighteen 80 eighty 9 nine 19 nineteen 90 ninety);
my $inp = <>;
chomp $inp;
$inp =~ s/(?<=[2-9])[1-9]$/'0-'.$h{$&}/e;
$inp =~ s/\d+/$h{$&}/;
print $inp;
