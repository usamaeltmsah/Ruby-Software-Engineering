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