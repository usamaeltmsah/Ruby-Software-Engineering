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