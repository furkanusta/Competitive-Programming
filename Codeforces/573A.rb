#
# Codeforces
# Title: Bear and Poker
# URL  : http://codeforces.com/problemset/problem/573/A
#

n = gets.chomp.to_i;
arr = gets.chomp.split.map(&:to_i);

n.times do |x|
  arr[x] /= 2 while (arr[x] % 2 == 0)
  arr[x] /= 3 while (arr[x] % 3 == 0);
end
puts (arr.uniq.size == 1 ? "Yes" : "No");
