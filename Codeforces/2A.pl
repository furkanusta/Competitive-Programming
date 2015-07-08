#
# Codeforces
# Title: Winner
# URL  : http://codeforces.com/problemset/problem/2/A
#
# First we iterate over all rounds and stored players points in %hash
#   While iterating we also stored every rounds' winner with his point in @table
# Then, we reiterate to find out who reached the maximum value first#

use strict;
use warnings;
my $n = <>;
my (@name, @point);
my @table = [];
my ($ans, $max) = (0, 0);
my %hash;
for my $i (1..$n) {
    ($name[$i], $point[$i]) = split " ", <>;
    $hash{$name[$i]} = 0 if(not exists $hash{$name[$i]});
    $hash{$name[$i]} += $point[$i];
    push @table, [$name[$i], $hash{$name[$i]}];
}
$max = $_ > $max ? $_ : $max foreach(values %hash);
for my $i (1..$n) {
    if ($hash{$name[$i]} == $max && $table[$i][1] >= $max) {
        print $name[$i] ."\n";
        last;
    }
}
