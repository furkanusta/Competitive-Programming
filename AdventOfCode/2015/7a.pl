# This has no 7b.pl instead I only modified the input file, I might fix one day
use strict;
use warnings;
use autodie;
use v5.10; # for say

use Data::Dumper;

open(my $file, '<', '7.inp');

my %values;
my %expr;

while (<$file>) {
    chomp;
    my @params = split;
    if ($params[0] eq 'NOT') {
        my $inp = $params[1];
        my $out = $params[-1];
        $expr{$inp}{0}{$out} = 'NOT';
    } elsif (scalar @params == 5) {
        my $left = $params[0];
        my $expr = $params[1];
        my $right = $params[2];
        my $out = $params[4];
        $expr{$left}{$right}{$out} = $expr;
        $expr{$right}{$left}{$out} = $expr;
    } else {
        my $const = $params[0];
        my $out = $params[2];
        if ($const =~ /\d+/) {
            $values{$out} = $const;
        } else {
            $expr{$const}{0}{$out} = 'OR';
        }
    }
}

my %result;
while (1) {
    if (!scalar(keys %values)) {
        last;
    }
    my %next;
    for my $left(keys %values) {
        my $val = $values{$left} & 65535;
        $result{$left} = $val;
        for my $right(keys %{$expr{$left}}) {
            if ($right =~ /\d+/) {
                for my $out(keys %{$expr{$left}{$right}}) {
                    my $op = $expr{$left}{$right}{$out};
                    $right = $right & 65535;
                    my $result = 0;
                    if ($op eq 'OR') {
                        $result = $val | $right;
                    } elsif ($op eq 'NOT') {
                        $result = $val ^ 0xFFFFFFFF;
                    } elsif ($op eq 'AND') {
                        $result = $val & $right;
                    } elsif ($op eq 'LSHIFT') {
                        $result = $val << $right;
                    } elsif ($op eq 'RSHIFT') {
                        $result = $val >> $right;
                    } else {
                        die "Unknown operation: $op";
                    }
                    $result = $result & 65535;
                    $next{$out} = $result;
                }
            } else {
                %{$expr{$val}{$right}} = %{$expr{$left}{$right}};
                %{$expr{$right}{$val}} = %{$expr{$left}{$right}};
            }
            delete $expr{$left}{$right};
            delete $expr{$right}{$left};
        }
    }
    %values = %next;
}

say $result{'a'};
