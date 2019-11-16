use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;

sub replace {
    my ($str, $start, $end, $rep) = @_;
    return substr($str, 0, $start) . $rep . substr($str, $end);
};

sub rec {
    my ($str, $target, $pat, $mark, $count) = @_;
    my $min = exists($mark->{$target}) ? $mark->{$target} : 2147483647;
    $mark->{$str} = $count;
    # say $str;
    if ($str eq $target || $count > $min || length($str) == 0) {
        return;
    }
    say $str;
    for my $key (keys %{$pat}) {
        my @val = @{$pat->{$key}};
        for my $val (@val) {
            while ($str =~ /$key/g) {
                my $rep = replace($str, $-[0], $+[0], $val);
                # say "$key $val $+[0] $-[0]";
                # say $str;
                # say $rep;
                # die;
                if (!exists($mark->{$rep})) {
                    rec($rep, $target, $pat, $mark, $count + 1);
                }
            }
        }
    }
};

open (my $file, '<', '19.inp');
my %pat;
while (<$file>) {
    chomp;
    last if (length $_ == 0);
    /(\w+) => (\w+)/;
    $pat{$2} = () unless exists $pat{$2};
    push @{$pat{$2}}, $1;
    # push @{$pat{$1}}, $2;
}

chomp(my $target = <$file>);
my %mark;
rec($target, 'e', \%pat, \%mark, 1);
say $mark{$target} - 1;
