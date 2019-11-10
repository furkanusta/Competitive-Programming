use strict;
use warnings;
use autodie;
use v5.10; # for say

use Digest::MD5 qw(md5_hex);

my $secret = 'ckczppom';
my @ans = (0);
while (1) {
    my $inp = $secret . join('', @ans);
    my $hash = md5_hex($inp);
    if ($hash =~ /^00000.*/) {
        say $secret;
        say join('', @ans);
        say $hash;
        last;
    }
    $ans[-1]++;
    my $idx = -1;
    my $length = @ans;
    while (($length + $idx) != 0 && $ans[$idx] == 10) {
        $ans[$idx] = 0;
        $ans[$idx - 1]++;
        $idx--;
    }
    if ($ans[0] == 10) {
        @ans = (0) x ($length + 1);
    }
}
