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

def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each { |el| new_arr << el if (prc1.call(el) || prc2.call(el)) == true && !(prc1.call(el) && prc2.call(el)) == true }
    new_arr
end

def proc_count(val, prcs)
    c = 0
    prcs.each { |prc| c += 1 if prc.call(val) == true }
    c
end