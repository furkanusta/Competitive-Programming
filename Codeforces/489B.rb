#
# Codeforces
# Title: BerSU Ball
# URL  : http://codeforces.com/problemset/problem/489/B
#

gets
a = gets.split.map { |x| x.to_i }.sort
gets
b = gets.split.map { |x| x.to_i }.sort.join(" ")

a.each do |x|
  b.sub!(/\b(#{x-1}|#{x}|#{x+1})\b/, "200")
end
puts b.scan(/200/).length
