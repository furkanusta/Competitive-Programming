#
# Codeforces
# Title: Vasya the Hipster
# URL  : http://codeforces.com/problemset/problem/581/A
#

a, b = gets.chomp.split.map(&:to_i).minmax;
puts "#{a} #{(b-a)/2}";

