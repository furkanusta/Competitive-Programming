#
# Codeforces
# Title: Robot's Task
# URL  : http://codeforces.com/problemset/problem/583/B
#

n = gets.chomp.to_i;
arr = gets.chomp.split.map(&:to_i);
info = 0;
ans = 0;
n.times do |i|

  n.times do |j|
    if (arr[j] <= info) 
      info += 1
      arr[j] = n + 2;
    end
  end;
  break if (info >= n);
  arr = arr.reverse;
  ans += 1;
end

puts ans;
