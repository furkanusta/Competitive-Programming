# I've decided to revert back to 'normal' approach as stated in 7a, since I've realized that I am filtering upon first match
count = 0
File.open('7.inp') do |f|
  f.each_line do |line|
    line.gsub(/\[\w*\]/, '').split('').each_cons(3) do |m|
      next if m[0] == m[1] || m[0] != m[2]
      next unless line =~ /\[\w*#{m[1]}#{m[0]}#{m[1]}\w*\]/
      count += 1
      break
    end
  end
end
p count
