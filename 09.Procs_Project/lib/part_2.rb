def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    words = sent.split
    new_words = []
    words.each { |w| new_words << prc.call(w) }
    new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    res1 = prc1.call(num)
    res2 = prc2.call(num)

    return [res1, res2].max
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each { |el| new_arr << el if prc1.call(el) && prc2.call(el)}
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |el, i|
        if i % 2 == 0
            new_arr << prc1.call(el)
        else
            new_arr << prc2.call(el)
        end
    end
    new_arr
end