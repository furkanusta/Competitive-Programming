#
# Codeforces
# Title: Contest
# URL  : http://codeforces.com/problemset/problem/501/A
#
a, b, c, d = gets.chomp.split.map(&:to_i);

puts ["Vasya", "Tie", "Misha"][1 + ([3 * a / 10, a - a / 250 * c].max <=> [3 * b / 10, b - b / 250 * d].max)];

=begin

Here is a more readable solution
ans = ["Vasya", "Tie", "Misha"];
p1 = [3 * a / 10, a - a / 250 * c].max;
p2 = [3 * b / 10, b - b / 250 * d].max;

p ans[1 + p1 <=> p2];

=end

