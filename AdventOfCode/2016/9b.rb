# Store the nested paranteheses in a stack, and keep the current multiplier
inp = File.read('9.inp')
inp.gsub!(/\s/, '')
left = 0
rep = Array.new
count = 0
paren = 0
mult = 1
inp.each_char.each_with_index do |ch, idx|
  if ch == '(' then
    paren = 1
    left = idx
  elsif ch == ')'
    paren = 0
    x, y = inp[(left + 1) .. (idx - 1)].split('x').map(&:to_i)
    mult *= y
    rep.push([x, y, idx])
  else
    next unless paren.zero?
    count += mult
    while not rep.empty? and (idx - rep.last[2]) == rep.last[0] do
      mult /= rep.last[1]
      rep.pop
    end
  end
end
p count
