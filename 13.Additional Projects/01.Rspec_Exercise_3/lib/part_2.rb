def element_count(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    count
end