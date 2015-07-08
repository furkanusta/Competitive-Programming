#
# Codeforces
# Title: Spreadsheets
# URL:   http://codeforces.com/problemset/problem/1/B
#
# Code may not be readable. Sorry about that, I was trying to
#   make the code as compact as I can.
#
use strict;
use warnings;
use integer;

my @arr = ('A' .. 'Z');
sub ntos {
    my $n = shift;
    my $s = '';
    while ($n > 0) {
	$s = @arr[$n % 26 - 1] . $s;
	$n-- unless ($n % 26);
	$n /= 26;
    }
    return $s;
}

sub ston {
    my $n = 0;
    $n = $n * 26 + ord($_) - 64 for (split //, shift);
    return $n;
}

my $n = int <>;
for (1 .. $n) {
    my $s = <>;
    if ($s =~ /^R([\d]+)C([\d]+)$/) {
        print ntos($2) . "$1\n";
    } else {
        $s =~ /^([\D]*)([\d]*)$/;
        print "R$2C" . (ston $1) . "\n";
    }
}
