#
# Codeforces
# Title: Rewards
# URL  : http://codeforces.com/problemset/problem/448/A
#
use strict;
use warnings;

my ($cup, $medal) = (0, 0);
$cup += $_ foreach(split / /, <>);
$medal += $_ foreach(split / /, <>);
$cup = int(($cup + 4) / 5);
$medal = int(($medal + 9) / 10);
print int<> - $cup - $medal >= 0 ? "YES\n" : "NO\n";

