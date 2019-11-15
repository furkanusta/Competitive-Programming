use strict;
use warnings;
use autodie;
use v5.10; # for say
use Storable qw(dclone);
use Data::Dumper;
use List::Util qw(sum);

sub count_neighbor {
    my ($arr, $x, $y) = @_;
    my $count = 0;
    for my $i(-1..1) {
        for my $j(-1..1) {
            $count += $arr->[$x + $i][$y + $j];
        }
    }
    $count -= $arr->[$x][$y]; # Do not include self
    return $count;
};

sub convert {
    my $arr = shift;
    my $len = scalar @{$arr};
    for my $i(1...$len - 2) {
        print('[');
        for my $j(1...$len - 2) {
            print($arr->[$i][$j] ? '#' : '.');
        }
        print("]\n");
    }
    print("\n");
    return $arr;
};

open (my $file, '<', '18.inp');

my @grid;
while (<$file>) {
    chomp;
    my @row;
    push @row, $_ for(map { $_ eq '#' ? 1 : 0 } split(//, $_));
    push @grid, [0, @row, 0];
}
my $len = scalar @{$grid[0]};
my @extra = ((0) x $len);
push @grid, [@extra];
unshift @grid, [@extra];

my $trial = 100;
for my $k (1..$trial) {
    my $next = dclone(\@grid);
    for my $i (1...$len - 2) {
        for my $j (1...$len - 2) {
            my $neigh = count_neighbor(\@grid, $i, $j);
            if ($grid[$i][$j]) {
                $next->[$i][$j] = 0 unless ($neigh == 2 || $neigh == 3);
            } else {
                $next->[$i][$j] = 1 if ($neigh == 3);
            }
        }
    }
    @grid = @{$next};
}

my $sum = 0;
$sum += sum @{$_} for(@grid);
say $sum;
