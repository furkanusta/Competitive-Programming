#
# Codeforces
# Title: T-primes
# URL  : http://codeforces.com/problemset/problem/230/B
#

# require 'prime'
# built-in function for Prime-Number generation gets TLE

gets.to_i;
arr = gets.chomp.split(' ').map(&:to_i);
primes = Array.new(1000000, 1);
primes[1] = nil;
(2..1000000).each do |i|
  if primes[i]
    (i**2).step(1000000, i) {|m| primes[m] = nil}
  end
end

arr.each {|x|
  sq = Math.sqrt(x).to_i;
  puts (sq**2 == x && primes[sq] ? "YES" : "NO")
}
