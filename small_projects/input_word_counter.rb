# Input word counter or Histogram

puts "Enter your string"
my_string = gets.chomp

histogram = Hash.new(0)

my_string.split.each do |word| 
  histogram[word] += 1
end

histogram.each { |key, value| puts "#{key} : #{value}" }