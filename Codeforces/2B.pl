#
# Codeforces
# Title: The least round way
# URL  : http://codeforces.com/problemset/problem/2/B
#
use strict;
use warnings;
sub min {
    return $_[1] if ($_[0] > $_[1]);
    return $_[0];
}
my $n = <>;
my @arr;
my @path;
my @dp;
push @arr, [split " ", <>] for(1..$n);

for my $i(0..$n-1) {
    for my $j(0..$n-1) {
        if ($arr[$i][$j] == 0) {
            print "0\n";
            print 'D'x$i . 'R'x$j . 'D'x($n-$i) . 'R'x($n-$j);
            exit 0;
        }
    }
}
$dp[0][0] = [$arr[0][0] % 2, $arr[0][0] % 5];
for my $i (1..$n-1) {
    $dp[0][$i] = [$dp[0][$i - 1][0] + ($arr[0][$i] % 2)?0:int($arr[0][$i]/2),
                  $dp[0][$i - 1][1] + ($arr[0][$i] % 5)?0:int($arr[0][$i]/5)];
    $path[0][$i] = 'R';
}
for my $i (1..$n-1) {
    $dp[$i][0] = [$dp[$i - 1][0][0] + ($arr[$i][0] % 2)?0:int($arr[$i][0]/2),
                  $dp[$i - 1][0][1] + ($arr[$i][0] % 5)?0:int($arr[$i][0]/5)];
    $path[$i][0] = 'D';
}
my ($a2, $a5);
for my $i (1..$n-1) {
    for my $j (1..$n-1) {
        $a2 = ($arr[$i][$j] % 2)?0:int($arr[$i][$j] / 2);
        $a5 = ($arr[$i][$j] % 5)?0:int($arr[$i][$j] / 5);
        if (min($dp[$i][$j - 1][0] + $a2, $dp[$i][$j - 1][1] + $a5) <
            min($dp[$i - 1][$j][0] + $a2, $dp[$i - 1][$j][1] + $a5)) {
            $dp[$i][$j] = [$dp[$i][$j - 1][0] + $a2, $dp[$i][$j - 1][1] + $a5];
            $path[$i][$j] = 'R';
            print "$i $j R $dp[$i][$j][0] $dp[$i][$j][1]\n";
        }
        else {
            $dp[$i][$j] = [$dp[$i - 1][$j][0] + $a2, $dp[$i - 1][$j][1] + $a5];
            $path[$i][$j] = 'D';
            print "$i $j D $dp[$i][$j][0] $dp[$i][$j][1]\n";
        }
    }
}
my ($x, $y) = ($n-1,$n-1);

my @ans;
while ($x != 0 || $y != 0) {
    push @ans, $path[$x][$y];
    if ($path[$x][$y] eq 'D') {
        $x--;
    }
    else {
        $y--;
    }
}
print min($dp[$n-1][$n-1][0], $dp[$n-1][$n-1][1]);
print "\n" . reverse @ans;
