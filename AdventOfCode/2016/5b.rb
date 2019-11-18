require 'digest'
inp = 'ffykfhsq'
pass = Array.new(8, false)
1.upto(Float::INFINITY).each do |i|
  md5 = Digest::MD5.hexdigest inp + i.to_s
  if md5.start_with?('00000') then
    next if md5[5].ord >= 96
    index = md5[5].to_i
    next if index >= pass.length
    next if pass[index] != false
    pass[index] = md5[6]
  end
  break unless pass.any?{|ch| ch == false}
end
p pass.join
