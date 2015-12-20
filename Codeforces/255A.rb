#
# Codeforces
# Title: Greg's Workout
# URL  : http://codeforces.com/problemset/problem/255/A
#

n = gets.chomp.to_i;
arr = gets.chomp.split(' ').map(&:to_i);
ans = [[0, 0],[0, 1], [0, 2]];

n.times { |x|
  ans[x % 3][0] += arr[x];
}

ans.sort!;

if (ans[2][1] == 0)
  puts "chest";
elsif (ans[2][1] == 1)
  puts "biceps";
else
  puts "back";
end

=begin

Better answer from I_love_Hoang_Yen

puts ["chest", "biceps", "back"][ans.index(ans.max)]

without using sort and 2-dimensional array

=end

