inp = File.read('1.inp')
direction = 0 # 0 north, 1 east, 2 south, 3 west
x = 0
y = 0

inp.split(', ').each { |inst|
  if inst[0] == 'L' then
    direction = (direction - 1) % 4;
  elsif inst[0] == 'R' then
    direction = (direction + 1) % 4;
  end
  distance = inst[1..-1].to_i
  case direction
  when 0
    y += distance
  when 1
    x += distance
  when 2
    y -= distance
  when 3
    x -= distance
  end
}
p x.abs + y.abs
