# It seems like my Ruby answers are starting to look worse than Perl
# Maybe, it could've been done with a single pass using a plain old each block with manual counting updates
lines = File.readlines('7.inp').map{|line| line.chomp}
matches = lines.each.map{|line| line.match(/.*(\w)(\w)\2\1.*/)}.select{|m, idx| m && m[1] != m[2]}
filtered = matches.map{|m| [m[0], m[0].match(/.*\[\w*(\w)(\w)\2\1\w*\].*/)]}.select{|m| !m[1]}.map{|m| m[0]}
p filtered.length
