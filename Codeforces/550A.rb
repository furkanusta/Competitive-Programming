#
# Codeforces
# Title: Two Substrings
# URL  : http://codeforces.com/problemset/problem/550/A
#
s = gets.chomp;
ans = "NO\n";
ans = "YES\n" if (s =~ /AB[A-Z]*BA/ || s =~ /BA[A-Z]*AB/);
puts ans;
