#
# Codeforces
# Title: Lucky Division
# URL  : http://codeforces.com/problemset/problem/122/A
#
use strict;
use warnings;

my $n = int(<>);
my $ans = "NO\n";

for my $i (4..$n) {
    if ($n % $i == 0 && is_lucky($i)) {
        $ans = "YES\n";
        last;
    }
}
print $ans;

sub is_lucky {
    my $x = shift;
    while ($x) {
        return 0 if ($x % 10 != 4 && $x % 10 != 7);
        $x = int($x / 10);
    }
    return 1;
}
