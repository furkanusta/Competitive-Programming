# Tried DFS, fails with stack-overflow. Possibly a similar result would occur via BFS. There are
# some heuristics posted on Reddit (A* or various greedy algorithms) but only a single one proposes
# a reasonable explanation. Taken from reddit
use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;

open (my $file, '<', '19.inp');
my %pat;
while (<$file>) {
    chomp;
    last if (length $_ == 0);
    /(\w+) => (\w+)/;
    $pat{reverse $2} = reverse $1;
}
chomp(my $string = reverse <$file>);

my $count = 0;
# TODO: Regex Syntax
$count++ while ($string =~ s/(@{[ join "|", keys %pat ]})/$pat{$1}/);
say $count;
