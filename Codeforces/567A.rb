#
# Codeforces
# Title: Lineland Mail
# URL  : http://codeforces.com/problemset/problem/567/A
#

n = gets.chomp.to_i;
arr = gets.chomp.split.map(&:to_i);
min = Array.new;
max = Array.new;
min[0] = arr[1] - arr[0];
max[0] = arr[-1] - arr[0];

(1..(n - 2)).each do |i|
   min[i] = [arr[i] - arr[i - 1], arr[i + 1] - arr[i]].min();
   max[i] = [arr[i] - arr[0], arr[-1] - arr[i]].max();
   # print min[i], max[i], arr[i], "\n";
 end
min.push(arr[-1] - arr[-2]);
max.push(arr[-1] - arr[0]);

(0..n-1).each do |i|
  puts "#{min[i]} #{max[i]}";
end
