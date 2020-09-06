def my_map(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << prc.call(el)}
    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << el if true == prc.call(el)}
    new_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each { |el| count += 1 if true == prc.call(el)}
    count
end