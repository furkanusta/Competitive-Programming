#
# Codeforces
# Title: Olesya and Rodin
# URL  : http://codeforces.com/problemset/problem/584/A
#
n, t = gets.chomp.split.map(&:to_i);
n = n - 1 if (t == 10);
puts n == 0 ? "-1" : t.to_s + "0" * (n - 1);
