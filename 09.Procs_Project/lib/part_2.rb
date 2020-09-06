def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    words = sent.split
    new_words = []
    words.each { |w| new_words << prc.call(w) }
    new_words.join(" ")
end