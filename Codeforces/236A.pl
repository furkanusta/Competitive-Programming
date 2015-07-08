#
# Codeforces
# Title: Bor or Girl
# URL  : http://codeforces.com/problemset/problem/236/A
#
use strict;
use warnings;
my %hash = map { $_, 1 } split //, <>;	# Remove duplicates
print ((scalar keys %hash) % 2 ? "CHAT WITH HER!":"IGNORE HIM!");
