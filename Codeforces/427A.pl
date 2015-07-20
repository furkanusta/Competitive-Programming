#
# Codeforces
# Title: Police Recruits
# URL  : http://codeforces.com/problemset/problem/427/A
#
use strict;
use warnings;
<>;
my $n = 0;
my $ans = 0;
foreach(split / /, <>) {
    $n += int $_;
    if ($n < 0) {
        $ans++;
        $n = 0;
    }
}
print $ans . "\n";
