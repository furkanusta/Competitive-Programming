count = 0
inp = File.read('3.inp').split("\n").collect(&:split).transpose
# p inp.length
# p inp[0].length
inp.each do |line|
  line.map(&:to_i).each_slice(3) do |x, y, z|
    next if x + y <= z
    next if x + z <= y
    next if z + y <= x
    count += 1
  end
end
p count
