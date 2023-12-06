sum = 0

limit = {
  "red" => 12,
  "green" => 13,
  "blue" => 14,
}

File.open('input/day_2.txt').each do |line|
  game = line.scan(/Game (\d*): (.*)/).first
  val = game[0].to_i

  puts game[1]

  turns = game[1].split(";").map do |turn|
    turn.scan(/(\d+ \w+)/).map do |r|
      v = r.first.split(" ")
      [v[1], v[0].to_i]
    end.to_h
  end

  invalid = turns.any? do |turn|
    turn.any? do |color, v|
      v > limit[color]
    end
  end

  sum += val unless invalid 
end

puts sum




sum = 0

File.open('input/day_2.txt').each do |line|
  game = line.scan(/Game (\d*): (.*)/).first
  val = game[0].to_i

  puts game[1]

  turns = game[1].split(";").map do |turn|
    turn.scan(/(\d+ \w+)/).map do |r|
      v = r.first.split(" ")
      [v[1], v[0].to_i]
    end.to_h
  end

  fewest = {
    "red" => 1,
    "green" => 1,
    "blue" => 1, 
  }
  
  turns.each do |turn|
    turn.each do |color, v|
      fewest[color] = v if v > fewest[color]
    end
  end

  power = fewest.values.inject(:*)

  puts fewest
  puts power

  sum += power
end

puts sum
