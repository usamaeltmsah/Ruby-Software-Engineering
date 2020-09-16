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

# ---------------------------------------------------------------------------------

def hash_mapped(hash, prc, &block)
    new_hash = {}
    hash.each { |k, v| new_hash[block.call(k)] = prc.call(v) }
    new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

# ---------------------------------------------------------------------------------

def counted_characters(str)
    count = Hash.new(0)
    str.each_char { |ch| count[ch] += 1 }
    count.keys.select { |k| count[k] > 2 }
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

# ---------------------------------------------------------------------------------

def triplet_true?(str)
    count = Hash.new(0)
    str.each_char { |ch| count[ch] += 1 }
    count.keys.any? { |k| count[k] >= 3 }
end

p triplet_true?('terrrrrible')   # true
p triplet_true?('caaabb')        # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false