def all_words_capitalized?(words)
    words.all? { |w| w == w.capitalize}
end