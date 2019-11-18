# Same as 6a, only .reverse after sort is removed
lines = File.read('6.inp').split("\n").map{|ln| ln.split('')}.transpose
sorted = lines.map{|ln| ln.inject(Hash.new(0)) { |total, e| total[e] += 1; total }.sort_by{|k,v| v}.reverse.take(1)}
p sorted.map{|freq| freq[0][0]}.join
