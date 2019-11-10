use strict;
use warnings;
use autodie;
use v5.10; # for say


# A pair of any two letters that appears at least twice in the string without overlapping
# , like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
# At least one letter which repeats with exactly one letter between them,
#   like xyx, abcdefeghi (efe), or even aaa.



sub nice {
    my $str = pop;
    if (!($str =~ /(..).*\1/)) {
        return 0;
    }
    if (!($str =~ /(.).\1/)) {
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
