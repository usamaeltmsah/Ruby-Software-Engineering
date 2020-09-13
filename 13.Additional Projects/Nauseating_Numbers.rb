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

# ---------------------------------------------------------------------------------------------------------------

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |ch|
        hash[ch] ||= 1
        hash[ch].times { |t| new_str += ch }
    end
    new_str
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# ---------------------------------------------------------------------------------------------------------------

def perfect_square?(num)
    (0..num).each { |i| return true if num == i * i }
    return false
end

p perfect_square?(1)     # true
p perfect_square?(4)     # true
p perfect_square?(64)    # true
p perfect_square?(100)   # true
p perfect_square?(169)   # true
p perfect_square?(2)     # false
p perfect_square?(40)    # false
p perfect_square?(32)    # false
p perfect_square?(50)    # false

# ---------------------------------------------------------------------------------------------------------------

def anti_prime?(num)
    (num-1).downto(1).each { |i| return false if divisors_of(i).length >  divisors_of(num).length }
    return true
end

def divisors_of(num)
    divisors = []
    i = 2
    while i < num
        if num % i == 0
            divisors << i
            num /= i
        end
        i += 1
    end
    divisors
end

p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

# ---------------------------------------------------------------------------------------------------------------

def matrix_addition(mat1, mat2)
    row = mat1.length
    col = mat1[0].length
    sum_mat = Array.new(row) { Array.new(col, 0) }
    (0...row).each do |i|
        (0...col).each do |j|
            sum_mat[i][j] = mat1[i][j] + mat2[i][j]
        end
    end
    sum_mat
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]