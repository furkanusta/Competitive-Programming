#
# Codeforces
# Title: Lala Land and Apple Trees
# URL  : http://codeforces.com/problemset/problem/558/A
#

n = gets.to_i;
arr = Array.new();
ans = 0;

n.times {|x| arr[x] = gets.split.map(&:to_i)};
arr.push([0, 0]);
arr.sort!;
pos = arr.index([0, 0]);

s, e = 0, n;
if (pos > n - pos)
  s = pos - (n - pos) - 1;
elsif (pos < n - pos)
  e = pos + pos + 1;
end

(s..e).each {|x| ans += arr[x][1]};
puts ans;
