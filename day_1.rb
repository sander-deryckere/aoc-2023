sum = 0

File.open('input/day_1.txt').each do |line|
  digits = line.scan(/(\d)\w*(\d)/).join("")
  if digits.empty?
    digit = line.scan(/(\d)/).join("")
    digits = digit + digit
  end
  sum += digits.to_i
end

puts sum


sum = 0

mapper = {
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9
}

matcher = "(\\d|one|two|three|four|five|six|seven|eight|nine)"

File.open('input/day_1.txt').each do |line|
  puts line
  digits = line.scan(Regexp.new("#{matcher}\\w*#{matcher}"))
  if digits.empty?
    digit = line.scan(Regexp.new matcher).first.first
    digits = [[digit, digit]]
  end

  digits = digits.first.map do |d|
    mapper[d.to_sym] || d
  end.join("")

  puts digits
  sum += digits.to_i
end

puts sum
