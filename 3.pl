use strict;
use warnings;

my $n = int<>;
my @arr = map {int$_} split / /, <>;
my @sorted = sort @arr;
my %hash;
my $count = 0;
my $ans = 0;
for (0..$n-1) {
    if (exists $hash{$sorted[$_]}) {
        push @{$hash{$sorted[$_]}}, $_;
    } else {
        $hash{$sorted[$_]} = [$_];
    }
}
my $val;
my $max = 0;
for (0..$n-1) {
    $val = shift @{$hash{$arr[$_]}};
    $max = $val if ($val > $max);
    if ($max == $_) {
        $ans++;
        $max = $_ + 1;
    }
}
print "$ans\n";
