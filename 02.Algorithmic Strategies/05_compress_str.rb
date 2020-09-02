# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    compressed_str = ""
    c = 0
    (1..str.length).each do |i|
        c += 1
        if str[i-1] == str[i]
            next
        end
        compressed_str += c.to_s if c > 1 
        compressed_str += str[i-1]
        c = 0
    end
    compressed_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
