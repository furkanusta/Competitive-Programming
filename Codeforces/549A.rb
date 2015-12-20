#
# Codeforces
# Title: Face Detection
# URL  : http://codeforces.com/problemset/problem/549/A
#

n, m = gets.chomp.split.map(&:to_i);
arr = Array.new;
count = 0;

n.times {|i| arr[i] = gets.chomp.split('')};
(n-1).times do |i|
  (m-1).times do |j|
    count += 1 if (arr[i][j] + arr[i][j + 1] + arr[i + 1][j] + arr[i + 1][j + 1]).chars.sort.join.eql?("acef");
  end
end
p count;
