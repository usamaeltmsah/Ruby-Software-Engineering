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
    i = 1
    while i <= num
        if num % i == 0
            divisors << i
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

# ---------------------------------------------------------------------------------------------------------------

def mutual_factors(*nums)
    divisors = divisors_of(nums[0])
    nums.each { |num| divisors &= divisors_of(num) }
    divisors
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

# ---------------------------------------------------------------------------------------------------------------

def tribonacci_number(num)
    return 1 if num == 1 || num == 2
    tribon = [0, 1, 1, 2]
    (4..num).each { |i| tribon << tribon[i-1] + tribon[i-2] + tribon[i-3] }
    tribon[-1]
    #tribonacci_number(num - 1) + tribonacci_number(num - 2) + tribonacci_number(num - 3)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

# ---------------------------------------------------------------------------------------------------------------

def matrix_addition_reloaded(*arrs)
    return arrs[0] if arrs.length == 1
    row = arrs[0].length
    col = arrs[0][0].length
    arrs.each { |mat| return nil if row != mat.length || col != mat[0].length }
    sum_mat = Array.new(row) { Array.new(col, 0) }
    arrs.each do |mat|
        (0...row).each do |i|
            (0...col).each do |j|
                sum_mat[i][j] += mat[i][j]
            end
        end
    end
    sum_mat
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# ---------------------------------------------------------------------------------------------------------------

def squarocol?(mat)
    row = mat.length
    col = mat[0].length
    (0...row).each do |i|
        row_count = 0
        col_count = 0
        (0...col-1).each do |j|
            row_count += 1 if mat[i][j] == mat[i][j+1]
            col_count += 1 if mat[j][i] == mat[j+1][i]
        end
        return true if row_count == row - 1 || col_count == col - 1
    end
    return false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

# ---------------------------------------------------------------------------------------------------------------

def squaragonal?(mat)
    row = col = mat.length
    dig_1 = (0...row-1).all? { |i| (mat[i][i] == mat[i+1][i+1]) }
    dig_2 = (0...col-1).all? { |i| (mat[i][col-i-1] == mat[i+1][col-i-2]) }
    return dig_1 || dig_2
end

puts
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# ---------------------------------------------------------------------------------------------------------------

def pascals_triangle(num)
    trings = [[1], [1, 1]]
    (2...num).each do |i|
        tmp_tring = []
        tring = trings[i-1]
        (0..i).each do |j|
            if j > 0 && j < i
                tmp_tring << tring[j] + tring[j-1]
            elsif j == 0
                tmp_tring << tring[j]
            else
                tmp_tring << tring[-1]
            end
        end
        trings << tmp_tring
    end
    trings
end

def print_2d_arr(mat)
    mat.each { |sub| p sub.join(" ") }
end

print_2d_arr pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

print_2d_arr pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

# ---------------------------------------------------------------------------------------------------------------

def mersenne_prime(num)
    2 ** nth_prime(num) - 1
end

def is_prime?(num)
    return false if num < 2
    (2...num).each.all? { |i| num % i != 0  }
end

def nth_mersenne_prime(n)
    i = 1
    j = 2
    while i <= n
        while !is_prime?(j) || !is_prime?(2**j-1)
            j += 1
        end
        i += 1
        prime = j
        j += 1
    end
    prime
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071