#
# Codeforces
# Title: Luxurious Houses
# URL  : http://codeforces.com/problemset/problem/581/B
#

n = gets.chomp.to_i;
arr = gets.chomp.split.map(&:to_i);
max = arr[n - 1];
ans = [];
(n-2).downto(0) {|i|
  ans[i] = [max + 1 - arr[i], 0].max;
  max = [max, arr[i]].max;
}
ans[n - 1] = 0;
print ans.join(' ');
