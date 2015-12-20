#
# Codeforces
# Title: Sort the Array
# URL  : http://codeforces.com/problemset/problem/451/B
#
n = gets.to_i;
arr = gets.chomp.split(' ').map(&:to_i);
sorted = arr.sort;

if (arr == sorted)
  puts "yes\n1 1";
  exit;
end

left  = (0...n).find_index  {|i| arr[i] != sorted[i]};
right = (0...n).to_a.rindex {|i| arr[i] != sorted[i]};

arr = arr.first(left) + arr[left..right].reverse + arr.last(n - right - 1);

if (arr == sorted)
  puts "yes\n#{left + 1} #{right + 1}\n";
else
  puts "no";
end


