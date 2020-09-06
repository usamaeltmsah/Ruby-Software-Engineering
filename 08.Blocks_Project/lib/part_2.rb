def all_words_capitalized?(words)
    words.all? { |w| w == w.capitalize}
end

def no_valid_url?(urls)
    dom = ['.com', '.net', '.io', '.org']
    urls.none? { |url| url.end_with?(dom[0]) || url.end_with?(dom[1]) || url.end_with?(dom[2]) || url.end_with?(dom[3]) }
end