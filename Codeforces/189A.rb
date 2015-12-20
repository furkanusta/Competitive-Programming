#
# Codeforces
# Title: Cut Ribbon
# URL  : http://codeforces.com/problemset/problem/189/A
#

inp = gets.chomp.split.map(&:to_i);
n = inp.shift;
dn = Array.new(n + 1, -1e9);
dn[0] = 0;

(0..n).each do |x|
  for y in inp do
      dn[x] = [dn[x], 1 + dn[x - y]].max if (x - y >= 0);
  end
end
  
puts dn[n];
