def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dog_hashes)
    dog_hashes.reject { |hash| hash["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |sub| sub.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    new_str = ""
    str.each_char do |ch|
        new_str += ch
        new_str += "b" + ch if vowels.include?(ch)
    end
    new_str
end