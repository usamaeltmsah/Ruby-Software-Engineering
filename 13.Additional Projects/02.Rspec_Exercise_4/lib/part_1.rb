def my_reject(arr, &prc)
    arr.select { |el| prc.call(el) == false }
end

def my_one?(arr, &prc)
    c = 0
    arr.each { |el| c += 1 if prc.call(el) }
    return true if c == 1
    return false
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each { |k, v| new_hash[k] = v if prc.call(k, v) }
    new_hash
end