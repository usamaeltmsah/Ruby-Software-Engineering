def my_map(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << prc.call(el)}
    new_arr
end