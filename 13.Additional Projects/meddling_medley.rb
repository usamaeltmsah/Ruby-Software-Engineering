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

# ---------------------------------------------------------------------------------

def energetic_encoding(sent, hash)
    sent.each_char.with_index do |ch, i|
        if hash[ch]
            sent[i] = hash[ch]
        elsif sent[i] != " "
            sent[i] = '?'
        end
    end
    sent
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

# ---------------------------------------------------------------------------------

def uncompress(str)
    new_str = ""
    (0...str.length-1).each { |i| new_str += str[i] * (str[i+1]).to_i }
    new_str
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# ---------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------
### Phase 2: More difficult, maybe?

def conjunct_select(arr, *prcs)
    selected = []
    arr.each { |el| selected << el if prcs.all? { |prc| prc.call(el)} }
    selected
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(str)
    vowels = "aeiou"
    words = str.split
    words.each_with_index do |w, i|
        # Do nothing if len < 3
        if w.length < 3
            next
            # If first is vowel add "yay" at the end
        elsif vowels.include?(w[0].downcase)
            words[i] += "yay"
            # Otherwise, Go untill finding a vowel and add all the words before it at the end
        else
            first_vowel_ind = nil
            (0...w.length).each do |j|
                if vowels.include?(w[j])
                    first_vowel_ind = j 
                    break
                end
            end
            tmp = w[first_vowel_ind..] + w[0...first_vowel_ind] + "ay"
            # If words are capitalized in the original sentence, they should remain capitalized in the translated sentence
            tmp.capitalize! if words[i].capitalize == words[i]
            words[i] = tmp
        end
    end
    words.join(" ")
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"