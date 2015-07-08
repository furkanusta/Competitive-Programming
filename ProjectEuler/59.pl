#
# Project Euler
# Title: XOR decryiption
# URL  : https://projecteuler.net/problem=59
#
# We are doing frequency analysis. For more info:
# http://www.mathblog.dk/project-euler-59-xor-encryption/
#
use strict;
use warnings;
open(my $in, "<:encoding(UTF-8)", "p059_cipher.txt")
  or die "Could not open file!";
my $line;
$line = <$in>;
chomp $line;

my @array = split ",", $line;
my $length = scalar @array;
my @ascii = (0)x256;
$ascii[$_]++ foreach(@array);
my @keys = (0, 0, 0);
my @freq = ([0], [0], [0]);
# Finding the key
for my $i (0..$length - 1) {
    my $j = $i % 3;
    $freq[$j][$array[$i]]++;

    if ($freq[$j][$array[$i]] > $freq[$j][$keys[$j]]) {
        $keys[$j] = $array[$i];
    }
}
$_ ^= 32 foreach(@keys);
# This yields 'god' as our key
my $sum = 0;
for my $i (0..$length-1) {
    $sum += $array[$i] ^ $keys[$i % 3];
}
print $sum, "\n";
