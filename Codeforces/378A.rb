#
# Codeforces
# Title: Playing with Dice
# URL  : http://codeforces.com/problemset/problem/378/A
#

x, y = gets.chomp.split.map(&:to_i);
arr = Array.new(3, 0);
(1..6).each{|i|arr[ 1 + ((x - i).abs <=> (y - i).abs)] += 1};
print "#{arr[0]} #{arr[1]} #{arr[2]}";
