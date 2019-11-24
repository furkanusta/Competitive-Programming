bots = Hash.new
directions = Hash.new

def append(hash, key, val)
  hash[key] = [] unless hash.has_key?(key)
  hash[key].push(val)
end

File.open('10.inp') do |f|
  f.each_line do |line|
    if line =~ /bot (\d+) gives low to (output|bot) (\d+) and high to (output|bot) (\d+)/ then
      low = $2 == 'bot' ? "+#{$3}" : "-#{$3}";
      high = $4 == 'bot' ? "+#{$5}" : "-#{$5}";
      directions[$1] = [low, high];
    elsif line =~ /value (\d+) goes to bot (\d+)/ then
      append(bots, $2, $1.to_i)
    end
  end
end

done = false
outputs = Hash.new
until done or bots.empty? do
  new = Hash.new
  done = true
  bots.each do |k, v|
    if v.length == 2 then
      done = false
      low, high = directions[k]
      append(low.start_with?('-') ? outputs : new, low[1..-1], v.min)
      append(high.start_with?('-') ? outputs : new, high[1..-1], v.max)
    else
      append(new, k, v[0])
    end
  end
  bots = new
end
p outputs["0"][0] * outputs["1"][0] * outputs["2"][0]
