loc = [1, 1]
move = {'L' => [0, -1], 'R' => [0, 1], 'D' => [1, 0], 'U' => [-1, 0]}
File.open('2.inp', 'r') do |f|
  f.each_line do |line|
    line.chomp.each_char do |ch|
      nloc = [loc[0] + move[ch][0], loc[1] + move[ch][1]]
      loc[0] = nloc[0] unless nloc[0] < 0 || nloc[0] > 2
      loc[1] = nloc[1] unless nloc[1] < 0 || nloc[1] > 2
    end
    p 3 * loc[0] + loc[1] + 1
  end
end
