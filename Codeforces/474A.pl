#
# Codeforces
# Title: Keyboard
# URL  : http://codeforces.com/problemset/problem/474/A
#
use strict;
use warnings;
my @arr = ([split //,("qwertyuiop")],[split //,("asdfghjkl;")], [split //,"zxcvbnm,./"]);
chomp(my $ch  = <>);
$ch = $ch eq 'L' ? -1 : 1;
my @str = split //,<>;
pop @str;
my %key;
for my $i(0..2) {
    for my $j(0..9) {
        $key{$arr[$i][$j]} = $arr[$i][$j - $ch];
    }
}
print $key{$_} foreach(@str);
