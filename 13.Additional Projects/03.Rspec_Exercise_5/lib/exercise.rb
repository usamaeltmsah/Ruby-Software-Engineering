def zip(*arrs)
    two_d_arr = Array.new(arrs[0].length) { Array.new(0) }
    arrs.each do |arr| 
        arr.each_with_index { |el, i| two_d_arr[i] << el }
    end
    two_d_arr
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each { |el| new_arr << el if (prc1.call(el) && prc2.call(el)) == false && (prc1.call(el) || prc2.call(el)) == true }
    new_arr
end

def zany_zip(*arrs)
    max_len = 0
    arrs.each { |arr| max_len = arr.length if max_len < arr.length }

    two_d_arr = Array.new(max_len) { Array.new(arrs.length) }
    arrs.each_with_index do |arr, i|
        arr.each_with_index do |el, j| 
            two_d_arr[j][i] = el
        end
    end
    two_d_arr
end

def maximum(arr, &prc)
    maxi = arr[0]
    arr.each { |el| maxi = el if prc.call(el) >= prc.call(maxi)}
    maxi
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = [] }
    arr.each { |el| hash[prc.call(el)] << el }
    hash
end

def max_tie_breaker(arr, len, &prc)
    maxi = arr[0]
    arr.each { |el| maxi = el if prc.call(el, len) > prc.call(maxi, len) }
    maxi
end

def silly_syllables(sent)
    words = sent.split
    new_words = words.map do |w|
        n_vowels = vowel_indices(w).length
        if n_vowels < 2
            w
        else
            change_word(w)
        end
    end
    new_words.join(" ")
end

def vowel_indices(str)
    vowels = "aeiou"
    indices = []
    str.each_char.with_index { |ch, i| indices << i if vowels.include?(ch) }
    indices
end

def change_word(str)
    vowels_indices = vowel_indices(str)
    str[vowels_indices[0]..vowels_indices[-1]]
end