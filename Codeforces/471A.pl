#
# Codeforces
# Title: MUH and Sticks
# URL  : http://codeforces.com/problemset/problem/471/A
#
use strict;
use warnings;
chomp(my $str = <>);
$str = join '', sort split / /, $str;
my $a = "Alien\n";
if ($str =~ s/(.)\1\1\1//) {	# Removes first 4 characters for legs
    $a = ($str =~ /(.)\1/) ? "Elephant\n" : "Bear\n";
}
print $a;
