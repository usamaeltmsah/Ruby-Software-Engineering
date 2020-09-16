### Phase 1: Modest problems.

def duos(str)
    c = 0
    len = str.length
    (1...len).each { |i| c += 1 if str[i] == str[i-1] }
    return c
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

# ---------------------------------------------------------------------------------

def sentence_swap(sent, hash)
    words = sent.split
    words.each_with_index { |w, i| words[i] = hash[w] if hash[w] }
    words.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'