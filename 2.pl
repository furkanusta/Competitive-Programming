use strict;
use warnings;

my ($n, $m) = map {int$_} split / /, <>;
my $ans = "Possible\n";
my @arr;
my @f = map {int$_} split / /, <>;
my @b = map {int$_} split / /, <>;
my %hash;
for(1..$n) {
    if (exists $hash{$f[$_ - 1]}) {
        $hash{$f[$_ - 1]}->[0]++;
    } else {
        $hash{$f[$_ - 1]} = [1, $_];
    }
}

for (@b) {
    if (not exists $hash{$_}) {
        $ans = "Impossible\n";
        last;
    } elsif ($hash{$_}->[0] > 1) {
        $ans = "Ambiguity\n";
        last;
    } else {
        push @arr, $hash{$_}->[1];
    }
}
print $ans;
print "@arr";
