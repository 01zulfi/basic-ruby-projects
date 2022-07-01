def sub_strings string, dictionary 
  string_array = string.split
  string_array.reduce(Hash.new(0)) do |hash, string| 
    dictionary.each do |word| 
      # downcased for case insensitive
      if string.downcase.include? word.downcase
        hash[word] += 1
      end
    end
    hash
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts  sub_strings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }