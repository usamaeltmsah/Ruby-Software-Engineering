def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    words = sent.split
    new_words = []
    words.each { |w| new_words << prc.call(w) }
    new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    res1 = prc1.call(num)
    res2 = prc2.call(num)

    return [res1, res2].max
end