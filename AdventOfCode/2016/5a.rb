require 'digest'
inp = 'ffykfhsq'
# inp = 'abc'
pass = Array.new
1.upto(Float::INFINITY).each do |i|
  md5 = Digest::MD5.hexdigest inp + i.to_s
  pass.push md5[5] if md5.start_with?('00000')
  break if pass.length == 8
end
p pass.join
