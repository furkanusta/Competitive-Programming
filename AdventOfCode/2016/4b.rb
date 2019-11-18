# Note that the key is not written in the question, but one can figure that out looking at the all decrypted names
File.open('4.inp', 'r') do |f|
  f.each_line do |line|
    *rooms, rest = line.chomp.split('-')
    index = rest.split('').find_index('[')
    id = rest[0...index].to_i
    dec = rooms.map {|str| str.chars.map{|ch| ((ch.ord - 96 + id) % 26 + 96).chr}.join }.join(' ')
    p id if dec == 'northpole object storage'
  end
end
