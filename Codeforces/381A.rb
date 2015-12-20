#
# Codeforces
# Title: Sereja and Dima
# URL  : http://codeforces.com/problemset/problem/381/A
#

n = gets.chomp.to_i;
arr = gets.chomp.split(' ').map(&:to_i);

i, j = 0, n - 1;
ans = [0, 0];
count = 0;

n.times {
  if (arr[i] > arr[j])
    ans[count] += arr[i];
    i += 1;
  else
    ans[count] += arr[j];
    j -= 1;
  end
  count = 1 - count;
}
puts ans;

# Instead of two pointers, arr.shift and arr.pop can be used;
