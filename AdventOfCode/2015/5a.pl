use strict;
use warnings;
use autodie;
use v5.10; # for say

# at least three vowels (aeiou only)
# at least one letter that appears twice in a row
# It does not contain ab, cd, pq, or xy


sub nice {
    my $str = pop;
    if (!($str =~ /[aeiou].*[aeiou].*[aeiou]/)) {
        return 0;
    }
    if (!($str =~ /(.)\1/)) {
        return 0;
    }
    if ($str =~ /(ab|cd|pq|xy)/) {
        return 0;
    }
    return 1;
};

open (my $file, '<', '5.inp');
my $count = 0;
while (<$file>) {
    chomp;
    $count++ if nice $_;
}
say $count;
