#
# Codeforces
# Title: cAPS lOCK
# URL  : http://codeforces.com/problemset/problem/131/A
#
use strict;
use warnings;
my $str = <>;
chomp $str;
my $ans = $str;
if ($str =~ /\b([a-z])([A-Z]+)?\b/) {
    $ans = uc($1);
    $ans .= lc($2) if ($2);
}
elsif ($str =~ /\b[A-Z]+\b/) {
    $ans = lc($str);
}
print $ans . "\n";
