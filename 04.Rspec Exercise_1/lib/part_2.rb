def hipsterfy(word)
    vowels = "aeiou"
    i = -1
    while i >= -(word.length)
        if vowels.include?(word[i])
            word[i] = ""
            break
         end
        i -= 1
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    counts = Hash.new(0)
    str.downcase.each_char { |ch| counts[ch] += 1 if vowels.include?(ch)}
    counts
end