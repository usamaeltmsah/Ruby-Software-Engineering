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