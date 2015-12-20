#
# Codeforces
# Title: Lecture
# URL  : http://codeforces.com/problemset/problem/499/B
#

hash = Hash.new;
n, m = gets.chomp.split.map(&:to_i);

m.times do
  a, b = gets.chomp.split;
  hash[a] = b.length < a.length ? b : a;  
end
gets.chomp.split.each {|x| print hash[x] + " "};
