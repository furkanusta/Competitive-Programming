inp = File.read('1.inp')
direction = 0 # 0 north, 1 east, 2 south, 3 west
loc = [0, 0]
mov = [[1, 0], [0, 1], [-1, 0], [0, -1]]
visit = Hash.new
visit[loc] = 1
inp.split(', ').each { |inst|
  if inst[0] == 'L' then
    direction = (direction - 1) % 4;
  elsif inst[0] == 'R' then
    direction = (direction + 1) % 4;
  end
  distance = inst[1..-1].to_i
  1.upto(distance).each { |d|
    loc[0] += mov[direction][0]
    loc[1] += mov[direction][1]
    if visit.has_key?(loc) then
      p loc
      p loc[0].abs + loc[1].abs
      exit(0)
    end
    visit[loc] = 1
  }
}
