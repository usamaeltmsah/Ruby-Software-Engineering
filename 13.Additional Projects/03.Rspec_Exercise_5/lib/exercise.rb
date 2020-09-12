def zip(*arrs)
    (0...arrs[0].length).map { |i| arrs.map { |arr| arr[i] } }
end

def prizz_proc(arr, prc1, prc2)
    arr.select { |el| !(prc1.call(el) && prc2.call(el)) && (prc1.call(el) || prc2.call(el))}
end

def zany_zip(*arrs)
    length = arrs.map(&:length).max # Get the max length of all the arrays
    (0...length).map { |i| arrs.map { |arr| arr[i] } }
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