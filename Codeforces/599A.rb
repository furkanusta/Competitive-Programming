#
# Codeforces
# Title: Patrick and Shopping
# URL  : http://codeforces.com/problemset/problem/599/A
#

d1, d2, d3 = gets.chomp.split(' ').map(&:to_i);
puts [d1 + d2 + d3, 2 * d1 + 2 * d2, 2 * d1 + 2 * d3, 2 * d2 + 2 * d3].min;

# Home->First->Second->Home,
# Home->First->Home->Second->Home,
# Home->First->Second->First->Home
# Home->Second->First->Second->Home
