#
# Codeforces
# Title: Minimum DIfficulty
# URL  : http://codeforces.com/problemset/problem/496/A
#

n = gets.chomp.to_i;
arr = gets.chomp.split.map(&:to_i);
max = 0;
ans = 0x7fffffff;

(1...n).each {|i| max = [max, arr[i] - arr[i - 1]].max};
(2...n).each {|i| ans = [ans, [max, arr[i] - arr[i - 2]].max].min};
p ans;
# p max;
