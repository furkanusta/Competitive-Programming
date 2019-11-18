# Normally there is no need to sort the checksum and common[] but it works and easier this way
sum = 0
File.open('4.inp', 'r') do |f|
  f.each_line do |line|
    *rooms, rest = line.chomp.split('-')
    rooms = rooms.flat_map{|r| r.split('')}
    sorted = rooms.inject(Hash.new(0)) { |total, e| total[e] += 1; total }.sort_by{|k,v| v}.reverse
    fifth = sorted[4][1]
    greater = sorted.select{|r| r[1] > fifth}.map{|x, y| x}
    equal = sorted.select{|r| r[1] == fifth}.map{|x, y| x}.sort.take(5 - greater.length)
    common = greater.concat(equal).sort.join
    index = rest.split('').find_index('[')
    id = rest[0...index].to_i
    chksum = rest[index+1..-2].split('').sort.join
    sum += id if common == chksum
  end
end
p sum
