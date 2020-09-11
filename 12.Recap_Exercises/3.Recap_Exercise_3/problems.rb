def no_dupes?(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    no_dupes_arr = []
    count.each { |k, v| no_dupes_arr << k if v == 1}
    no_dupes_arr
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

# ---------------------------------------------------------------------------

def no_consecutive_repeats?(arr)
    (0...arr.length-1).all? { |i| arr[i] != arr[i+1] }
end

# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

# ----------------------------------------------------------------------------

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = [] }
    str.each_char.with_index { |ch, i| hash[ch] << i }
    hash
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# ----------------------------------------------------------------------------

def longest_streak(str)
    last_long = ""
    cur_long = str[0]
    (1...str.length).each do |i|
        if str[i-1] == str[i]
            cur_long += str[i]
        else
            last_long = check_longest(last_long, cur_long)
            cur_long = str[i]
        end
    end
    check_longest(last_long, cur_long)
end

def check_longest(str1, str2)
    is_great_equal = str1.length <=> str2.length
    if is_great_equal <= 0
        str2
    else
        str1
    end
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy'
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

# ----------------------------------------------------------------------------

def bi_prime?(num)
    return false if num < 4
    (2...num).each do |i|
        (2...num).each do |j|
            return true if prime?(i) && prime?(j) && num == i * j
        end
    end
    return false
end

def prime?(num)
    (2...num).each { |i| return false if num % i == 0 }
    true
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

# ----------------------------------------------------------------------------

def vigenere_cipher(message, keys)
    alphabets = ('a'..'z').to_a.join
    new_str = ""
    keys_len = keys.length
    message.each_char.with_index do |ch, j|
        keys_ind = j % keys_len
        new_ind = (alphabets.index(ch) + keys[keys_ind]) % 26
        new_str += alphabets[new_ind]
    end
    new_str
end

# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# ----------------------------------------------------------------------------

def vowel_rotate(str)
    vowels = "aeiou"
    vowels_dict = {}
    str.each_char.with_index { |ch, i| vowels_dict[i] = ch if vowels.include?(ch) }
    rotated_vowels = rotate_values(vowels_dict.values)
    j = 0
    vowels_dict.keys.each do |i|
        str[i] = rotated_vowels[j]
        j += 1
    end
    str
end

def rotate_values(arr)
    el = arr.pop
    arr.unshift(el)
end

# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

# ----------------------------------------------------------------------------

class String
    def select(&prc)
        prc ||= Proc.new { |ch| ""}
        self.each_char.map { |ch| ch if prc.call(ch) == true}.join
    end

    def map!(&prc)
        prc ||= Proc.new { |ch| ""}
        self.each_char.with_index { |ch, i| self[i] = prc.call(ch, i) }
    end
end

# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""


# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

# ----------------------------------------------------------------------------

def multiply(a, b)
    return 0 if a == 0 || b == 0
    
    return b + multiply(a-1, b) if a > 0
    return -b + multiply(a+1, b) if a < 0
end


# Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
