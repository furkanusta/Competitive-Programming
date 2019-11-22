# There is no 8b.rb for this one, just looking at the output was way easier
mat = Array.new(6) { Array.new(50) {0} }

File.open('8.inp') do |f|
  f.each_line.map(&:chomp).each do |line|
    if line =~ /rect (\d+)x(\d+)/ then
      x = $1.to_i
      y = $2.to_i
      (0...y).each do |i|
        (0...x).each do |j|
          mat[i][j] = 1
        end
      end
    elsif line =~ /rotate row y=(\d+) by (\d+)/
      x = $1.to_i
      y = $2.to_i
      row = mat[x].rotate(-y)
      mat[x] = row
    elsif line =~ /rotate column x=(\d+) by (\d+)/
      x = $1.to_i
      y = $2.to_i
      col = mat.transpose()[x].rotate(-y)
      (0...col.length).each do |i|
        mat[i][x] = col[i]
      end
    end
  end
end
p mat.map{|row| row.reduce(&:+) }.reduce(&:+)
# mat.each{|m| p m}
