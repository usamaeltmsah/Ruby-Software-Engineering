def element_count(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    count
end

def char_replace!(str, hash)
    keys = hash.keys
    str.each_char.with_index { |ch, i| str[i] = hash[ch] if keys.include?(ch) }
    str
end

def product_inject(arr)
    arr.inject { |acc, i| acc * i}
end