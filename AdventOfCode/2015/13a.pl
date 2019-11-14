use strict;
use warnings;
use autodie;
use Data::Dumper;
use v5.10; # for say


my $max = 0;
sub dfs {
    my ($curr, $mat, $mark, $path) = @_;
    my $found = 0;
    for (keys %{$mat->{$curr}}) {
        if (!$mark->{$_}) {
            $found = 1;
            $mark->{$_} = 1;
            push @{$path}, $_;
            my $cost = dfs($_, $mat, $mark, $path);
            pop @{$path};
            $mark->{$_} = 0;
        }
    }
    unless ($found) {
        my $cost = 0;
        my $old = $path->[-1];
        for(@{$path}) {
            $cost += $mat->{$old}{$_};
            $cost += $mat->{$_}{$old};
            $old = $_;
        }
        if ($cost > $max) {
            $max = $cost;
        }
    }
};

open (my $file, '<', '13.inp');
my %edges;
while(<$file>) {
    chomp;
    /(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)/;
    my $src = $1;
    my $dest = $4;
    my $cost = $2 eq 'gain' ? $3 : -$3;
    $edges{$src}{$dest} = $cost;
}

for (keys %edges) {
    my %mark;
    $mark{$_} = 0 for(keys %edges);
    $mark{$_} = 1;
    my @path= ($_);
    my $cost = dfs($_, \%edges, \%mark, \@path);
}
say $max;
