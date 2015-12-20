#
# Codeforces
# Title: Lunch Rush
# URL  : http://codeforces.com/problemset/problem/276/A
#

n, k =gets.chomp.split.map(&:to_i);
ans = -1e9;

n.times do
  x, y = gets.chomp.split.map(&:to_i);
  x = x - y + k if (y > k);
  ans = [ans, x].max;
end
p ans;
