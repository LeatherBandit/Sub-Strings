#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, data_dictionary)
    substring_array = []
    final_hash= Hash.new
    #Split the word into a char array
    word = word.downcase.split("")
    #iterate through char array
    word.each_with_index do |character, index|
        #Setting i to index prevents empty entries to substring_array
        i = index
        #inner loop to find each substring of the current index
        while i < word.length
            #push the value of the word array at current index to i, joining ensures they are stored together as a string. 
            substring_array.push(word[index..i].join(""))
            i+= 1
        end
    end
    #iterate through each word in data dictionary
    data_dictionary.each do |word|
        #Temp array to hold the value of the select return in the loop
        temp_array = substring_array.select  {|substring_element| substring_element == word}
        if temp_array.length > 0
            final_hash[word] = temp_array.length
        end
    end
    return final_hash
end

puts substrings("down", dictionary)
