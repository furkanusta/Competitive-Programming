#
# Codeforces
# Title: Kefa and First Steps
# URL  : http://codeforces.com/problemset/problem/580/A
#

n = gets.chomp.to_i() - 1;
a = gets.chomp.split.map(&:to_i);
ans = 1;
max = 1;
(1..n).each do |x|
  if (a[x] >= a[x - 1])
      ans += 1;
      max = [max, ans].max;
  else
    ans = 1;
  end
end
p max;
