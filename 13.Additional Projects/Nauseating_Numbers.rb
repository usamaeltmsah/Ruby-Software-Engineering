def strange_sums(arr)
    c = 0
    (0...arr.length).each { |i| (i...arr.length).each { |j| c += 1 if arr[i] == -arr[j] } }
    c
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

# ---------------------------------------------------------------------------------------------------------------

def pair_product(arr, num)
    (0...arr.length).each { |i| (i...arr.length).each { |j| return true if num == arr[i] * arr[j] } }
    return false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false
