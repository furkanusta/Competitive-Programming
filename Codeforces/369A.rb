#
# Codeforces
# Title: Valera and Plates
# URL  : http://codeforces.com/problemset/problem/369/A
#

n, m, k = gets.chomp.split.map(&:to_i);
arr = gets.chomp.split.map(&:to_i);
ans = 0;

arr.each do |x|
  if (x == 1) then
    if (m > 0)
      m -= 1;
    else
      ans += 1;
    end
  elsif (k > 0)
    k -= 1;
  elsif (m > 0)
    m -= 1;
  else
    ans += 1;
  end         
end
p ans;
