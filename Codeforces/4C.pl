#
# Codeforces
# Title: Registration System
# URL  : http://codeforces.com/problemset/problem/4/C
#
use strict;
use warnings;
my %hash;
for my $i(1..int<>) {
    chomp($_ = <>);
    if (not exists $hash{$_}) {
        print "OK\n";
        $hash{$_} = 1;
        next;
    }
    print $_ . $hash{$_} . "\n";
    $hash{$_}++;
}
