use strict;
use warnings;

sub min{
    my $min = $_[0];
    for(@_) {
        $min = $_ if ($_ < $min);
    }
    return $min;
}
my ($d1, $d2, $d3) = split / /, <>;

print min($d1 + min($d3, $d1 + $d2) + min($d2 + $d1 + $d3), $d2 + min($d3, $d1 + $d2) + min($d1, $d3 + $d2)) . "\n";
