#
# Codeforces
# Title: Cinema Line
# URL  : http://codeforces.com/problemset/problem/349/B
#
use strict;
use warnings;
<>;
my $ans = "YES\n";
my ($tt, $ff) = (0, 0);
for (split / /, <>) {
    $tt++ 	 if($_ == 25);
    $ff++, $tt-- if($_ == 50);
    if ($_ == 100) {
        if ($ff && $tt) {
            $ff--;
            $tt--;
        }
        else {
            $tt -= 3;
        }
    }
    if ($tt < 0 || $ff < 0) {
        $ans = "NO\n";
        last;
    }
}
print $ans;
