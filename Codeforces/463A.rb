#
# Codeforces
# Title: Caise and Sugar
# URL  : http://codeforces.com/problemset/problem/463/A
#

(n, s) = gets.chomp.split.map(&:to_i);
max = -1
n.times do |x|
  (x, y) = gets.chomp.split.map(&:to_i);
  if (s - x) * 100 >= y 
    max = [max, (100 - y) % 100].max
  end
end
puts max;
