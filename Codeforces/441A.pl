#
# Codeforces
# Title: Valera and Antique Items
# URL  : http://codeforces.com/problemset/problem/441/A
#
use strict;
use warnings;
my ($n, $money) = split / /, <>;
my @ans;
for(1..$n) {
    push @ans, $_ if($money > (sort{$a <=> $b} split / /, <>)[1]);
}
print scalar @ans . "\n@ans";
