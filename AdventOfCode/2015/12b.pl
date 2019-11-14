use strict;
use warnings;
use autodie;
use v5.10; # for say
use Data::Dumper;
use Scalar::Util qw(looks_like_number);
use List::Util qw(any);
use JSON;

sub get {
    my $ref = shift;
    my $idx = shift;
    my $type = ref $ref;
    if ($type eq 'ARRAY') {
        return $ref->[$idx];
    } elsif ($type eq 'HASH') {
        return $ref->{$idx};
    } else {
        die "Unsupported type $type";
    }
};

sub iterate {
    my $ref = shift;
    my $sum = 0;
    my $type = ref $ref;
    if ($type eq 'HASH') {
        if(any { $_ eq 'red' } values %{$ref}) {
            return 0;
        }
    } elsif ($type eq 'SCALAR' || $type eq '') {
        return looks_like_number $ref ? $ref : 0;
    }
    for(keys $ref) {
        my $val = get($ref, $_);
        $sum += iterate($val);
    }
    return $sum;
};

my $input = do {
    local $\;
    open (my $file, '<', '12.inp');
    <$file>;
};
my $json = JSON->new->allow_nonref;
my $enc = $json->decode($input);
my $sum = iterate($enc);
say $sum;
