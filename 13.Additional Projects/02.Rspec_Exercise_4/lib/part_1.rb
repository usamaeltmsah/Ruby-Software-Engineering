def my_reject(arr, &prc)
    arr.select { |el| prc.call(el) == false }
end

def my_one?(arr, &prc)
    c = 0
    arr.each { |el| c += 1 if prc.call(el) }
    return true if c == 1
    return false
end