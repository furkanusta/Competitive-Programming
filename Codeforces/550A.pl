#
# Codeforces
# Title: Two Substrings
# URL  : http://codeforces.com/problemset/problem/550/A
#
use strict;
use warnings;

$_ = <>;
my $ans = "NO\n";
$ans = "YES" if (/AB.*BA/ || /BA.*AB/);
print $ans;

# Ruby couldn't handle this one (got TLE at input 8)
# ans = "YES\n" if (s =~ /AB[A-Z]*BA/ || s =~ /BA[A-Z]*AB/);
