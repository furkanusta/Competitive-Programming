# Using a global state could do away with the $path being passed around but this works
use strict;
use warnings;
use autodie;
use Data::Dumper;
use List::Util qw(all);
use Storable qw(dclone);
use v5.10; # for say

sub min {
    my ($a, $b)= @_;
    if ($a < $b) {
        return $a;
    }
    return $b;
}

my %id;
my %rid;
$Data::Dumper::Indent = 0;

sub dfs {
    my ($src, $ref, $mark, $cost, $path) = @_;
    my %hash = %{$ref};
    if (all {$_} @{$mark}) {
        return ($cost, $path);
    }
    my $id = 0;
    my $min = 2147483647;
    my @ans;
    for my $dest(keys $hash{$src}) {
        if (!$mark->[$dest]) {
            push @{$path}, $dest;
            $mark->[$dest] = 1;
            my ($m, $p) = dfs($dest, $ref, $mark, $cost + $hash{$src}{$dest}, $path);
            if ($m < $min) {
                $min = $m;
                @ans = dclone($p);
            }
            $mark->[$dest] = 0;
            pop @{$path};
        }
    }
    return ($min, @ans);
};

open (my $file, '<', '9.inp');

my $counter = 0;
my %edges;
while (<$file>) {
    chomp;
    my ($source, $skip, $destination, $op, $distance) = split;
    $id{$source} = $counter++ unless exists $id{$source};
    $id{$destination} = $counter++ unless exists $id{$destination};
    my $src = $id{$source};
    my $dest = $id{$destination};
    $rid{$src} = $source;
    $rid{$dest} = $destination;
    $edges{$src}{$dest} = $distance;
    $edges{$dest}{$src} = $distance;
}

my $min = 2147483647;
my @ans;
for my $i(0..$counter-1) {
    say $i;
    my @mark;
    push(@mark, 0) for(0..$counter-1);
    $mark[$i] = 1;
    my @p = ($i);
    my ($cost, @path) = dfs($i, \%edges, \@mark, 0, \@p);
    if ($cost < $min) {
        $min = $cost;
        @ans = dclone(\@path);
    }
}
say $min;
say Dumper(\@ans);
foreach(@{$ans[0][0]}) {
    say $_;
    say $rid{$_};
}
