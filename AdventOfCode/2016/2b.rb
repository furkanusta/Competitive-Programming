def valid(x, y)
  return false if x < 0 || y < 0 || x > 4 || y > 4
  return false if x + y < 2
  return false if y + x > 6
  return false if y - x > 2
  return false if x - y > 2
  return true
end

grid = [
  ['0', '0', '1', '0', '0'],
  ['0', '2', '3', '4', '0'],
  ['5', '6', '7', '8', '9'],
  ['0', 'A', 'B', 'C', '0'],
  ['0', '0', 'D', '0', '0']
]

loc = [2, 0]
move = {'L' => [0, -1], 'R' => [0, 1], 'D' => [1, 0], 'U' => [-1, 0]}
File.open('2.inp', 'r') do |f|
  f.each_line do |line|
    line.chomp.each_char do |ch|
      nloc = [loc[0] + move[ch][0], loc[1] + move[ch][1]]
      loc = nloc if valid(*nloc)
    end
    p grid[loc[0]][loc[1]]
  end
end
