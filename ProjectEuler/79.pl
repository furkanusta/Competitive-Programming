#
# Project Euler
# Title: Passcode Derivation
# URL  : https://projecteuler.net/problem=79
#
# !!! NOTE !!!
# This code is incomplete it yields 7316289
# However, I will not try to fix this sorry about that.
use strict;
use warnings;
open(my $in, "<:encoding(UTF-8)", "p079_keylog.txt")
  or die "Could not open file!";
my $line;
my $i = 0;
my @array;

while ($line = <$in>) {
    chomp $line;
    $array[$i++] = $line;
}
my %hash = map { $_ => 1 } @array;
@array = sort keys %hash;

my @before = map [(0) x 10], 0..10;
my $length = scalar @array;
for (my $i = 0; $i < $length; $i++) {
    @array[$i] = [split //, $array[$i]];
    $before[$array[$i][1]][$array[$i][0]] = 1;
    $before[$array[$i][2]][$array[$i][0]] = 1;
    $before[$array[$i][2]][$array[$i][1]] = 1;
}
# Second part of the solution
my $count = 0;
my $index = 0;
my @ans = ();
while (scalar @ans < 7) {
    # print scalar @ans;
    for my $i (0..9) {
        $count = 0;
        for my $j (0..9) {
            if ($before[$i][$j]) {
                $count++;
                $index = $j;
            }
        }
        if ($count == 1) {
            $before[$_][$index] = 0 for(0..9);
            push @ans, $index;
            last;
        }
    }
}
print @ans, "\n";
close $in;
# Answer: 73162890
