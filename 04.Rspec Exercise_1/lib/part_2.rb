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

def caesar_cipher(message, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    ciphered_message = ""
    
    message.each_char do |ch|
        if !alphabet.include?(ch)
            ciphered_message += ch
            next
        end
        old_idx = alphabet.index(ch)
        new_idx = old_idx + n
        ciphered_message += alphabet[new_idx % 26]
    end
    return ciphered_message
end