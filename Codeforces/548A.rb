#
# Codeforces
# Title: Mike and Fax
# URL  : http://codeforces.com/problemset/problem/548/A
#

str = gets.chomp;
n = gets.to_i;
ans = false;
ans = str.chars.each_slice(str.length / n).all?{|x| x == x.reverse} if (str.length % n == 0);
puts ans ? "YES\n":"NO\n";
