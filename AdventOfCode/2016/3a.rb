count = 0
File.open('3.inp', 'r') do |f|
  f.each_line do |line|
    x, y, z = line.chomp.split(' ').map(&:to_i)
    next if x + y <= z
    next if x + z <= y
    next if y + z <= x
    count += 1
  end
end
p count
