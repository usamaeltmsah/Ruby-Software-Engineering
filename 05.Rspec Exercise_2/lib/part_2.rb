def palindrome?(str)
    rev_str = ""
    i = str.length - 1
    while i >= 0
        rev_str += str[i]
        i -= 1
    end
    return rev_str == str
end

def substrings(str)
    subs = []
    (0...str.length).each do |i|
        (i+1...str.length+1).each do |l|
            subs << str[i...l]
        end
    end
    subs
end

def palindrome_substrings(str)
    pal_subs = []
    subs = substrings(str)
    subs.each do |sub|
        pal_subs << sub if sub.length > 1 && palindrome?(sub)
    end
    pal_subs
end