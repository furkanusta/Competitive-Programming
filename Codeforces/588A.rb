#
# Codeforces
# Title: Duff and Meat
# URL  : http://codeforces.com/problemset/problem/588/A
#

n = gets.chomp.to_i;
min = 0x7fffffff;
cost = 0;
n.times do |x|
  a, p = gets.chomp.split.map(&:to_i);
  min = [min, p].min;
  cost += a * min;
end
puts cost;
