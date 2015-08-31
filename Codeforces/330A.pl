#
# Codeforces
# Title: Cakeminator
# URL  : http://codeforces.com/problemset/problem/330/A
#
use strict;
use warnings;

my ($n, $m) = split / /, <>;
($n, $m) = ($n - 1, $m - 1);
my (@arr, @transposed);
my ($row, $column) = (0, 0);

chomp($arr[$_] = <>) for(0..$n);
/S/ or $row++ for (@arr);
$arr[$_] = [split //,$arr[$_]] for(0..$n);

for my $i(0..$m) {
    for my $j(0..$n) {
        $transposed[$i][$j] = $arr[$j]->[$m - $i];
    }
}
undef @arr;
$arr[$_] = join "", @{$transposed[$_]} for(0..$m);
/S/ or $column++ for (@arr);
($n, $m) = ($n + 1, $m + 1);
print $row * $m + $column * $n - $row * $column;
