def all_words_capitalized?(words)
    words.all? { |w| w == w.capitalize}
end

def no_valid_url?(urls)
    doms = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        doms.any? { |dom| url.end_with?(dom)}
    end
end