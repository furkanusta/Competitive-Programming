#
# Project Euler
# Title: Coded Triangle Numbers
# URL  : https://projecteuler.net/problem=42
#
use strict;
use warnings;
use experimental 'smartmatch';

my $filename = "p042_words.txt";
my $line;
open(my $file, '<:encoding(UTF-8)', $filename) or die "Die";

my @arr;
my $num;
my $ans = 0;
my $n = 0;

$line = <$file>;
chomp $line;
@arr = split(",", $line);
chop $_ foreach(@arr);
$_ = substr($_, 1) foreach(@arr);

for my $i (@arr) {
    $num = 0;
    for (split //, $i) {
        $num += ord($_) - 64;
    }
    $n = (sqrt(1 + 8 * $num) - 1) / 2;
    if ($n == int $n) {
        $ans++;
    }
}
print $ans, "\n";

# Answer: 162
