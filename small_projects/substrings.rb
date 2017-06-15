# substring counter

def substrings(substr, dictionary)
  substr_histogram = Hash.new(0)
  substr.downcase!
  substr = substr.split(" ")
  dictionary.each do |elem| 
    substr.each do |substr_elem|
      if substr_elem.include? elem
        substr_histogram[elem] += 1
      end
    end
  end
  puts substr_histogram.inspect
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)