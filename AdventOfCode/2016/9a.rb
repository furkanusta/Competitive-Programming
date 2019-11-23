inp = File.read('9.inp')
inp.gsub!(/\s/, '')
last_index = 0
decomp = ''
matches = inp.to_enum(:scan, /\((\d+)x(\d+)\)/).map { Regexp.last_match } # From SO
matches.each do |m|
  left = m.begin(0)
  right = m.end(0)
  next if left < last_index
  decomp += inp[last_index...left]
  last_index = (right+m[1].to_i)
  rep = inp[right...last_index]
  decomp += rep * m[2].to_i
end
p decomp.length
