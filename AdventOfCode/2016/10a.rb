bots = Hash.new
directions = Hash.new

def append(hash, key, val)
  hash[key] = [] unless hash.has_key?(key)
  hash[key].push(val)
end

File.open('10.inp') do |f|
  f.each_line do |line|
    if line =~ /bot (\d+) gives low to (output|bot) (\d+) and high to (output|bot) (\d+)/ then
      low = $2 == 'bot' ? $3.to_i : -$3.to_i;
      high = $4 == 'bot' ? $5.to_i : -$5.to_i;
      directions[$1.to_i] = [low, high];
    elsif line =~ /value (\d+) goes to bot (\d+)/ then
      append(bots, $2.to_i, $1.to_i)
    end
  end
end


found = false
until found or bots.empty? do
  new = Hash.new
  bots.each do |k, v|
    if v.length == 2 then
      low, high = directions[k]
      append(new, low, v.min) if low > 0
      append(new, high, v.max) if high > 0
      if v.sort == [17, 61] then
        p k
        found = true
        break
      end
    else
      append(new, k, v[0])
    end
  end
  bots = new
end
