#
# Codeforces
# Title: Vitaly and Pie
# URL  : http://codeforces.com/problemset/problem/525/A
#

n = gets.chomp.to_i;
arr = gets.chomp.split("").map{|x| x.upcase.ord - 65;};
map = Array.new(26, 0);
ans = 0;

(n-1).times do |i|
  i = 2 * i;
  # print i, " ", arr[i], "\n";
  map[arr[i]] += 1;
  i += 1;
  map[arr[i]] -= 1;
  if map[arr[i]] == -1
    map[arr[i]] = 0;
    ans += 1;
  end
end
puts ans;
