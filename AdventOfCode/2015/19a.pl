use strict;
use warnings;
use autodie;
use v5.10; # for say

sub replace {
    my ($str, $start, $end, $rep) = @_;
    return substr($str, 0, $start) . $rep . substr($str, $end);
};

open (my $file, '<', '19.inp');
my %pat;
while (<$file>) {
    chomp;
    last if (length $_ == 0);
    /(\w+) => (\w+)/;
    $pat{$1} = () unless exists $pat{$1};
    push @{$pat{$1}}, $2;
}

chomp(my $inp = <$file>);

my %seen;
for my $key(keys %pat) {
    my @val = @{$pat{$key}};
    for my $val(@val) {
        while ($inp =~ /$key/g) {
            my $rep = replace($inp, $+[0], $-[0], $val);
            $seen{$rep} = 1;
        }
    }
}
say scalar keys %seen;
