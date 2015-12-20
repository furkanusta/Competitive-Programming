#
# Codeforces
# Title: Exams
# URL  : http://codeforces.com/problemset/problem/479/C
#

n = gets.chomp.to_i;
arr = Array.new(n);

n.times { |x|
  arr[x] = gets.chomp.split(' ').map(&:to_i);
}
arr.sort!;
pre = -1;

arr.each { |x, y|
  if (pre <= y)
    pre = y;
  else
    pre = x;
  end  
}
puts pre;
