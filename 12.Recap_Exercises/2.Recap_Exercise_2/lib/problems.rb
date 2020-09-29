# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    # Num_1 is always < Num_2
    num_1, num_2 = num_2, num_1 if num_1 > num_2
    return num_2 if num_2 % num_1 == 0
    while num_1 > 0
        return num_1 * num_2 if num_2 % num_1 == 0
        num_1 -= 1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = []
    count = Hash.new(0)
    (0...str.length-1).each { |i| bigrams << str[i..i+1] }
    bigrams.each { |bi| count[bi] += 1 }
    count.key(count.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each { |k, v| new_hash[v] = k}
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        len = self.length
        c = 0
        (0...len).each do |i|
            (i+1...len).each do |j|
                c += 1 if num == self[i] + self[j]
            end
        end
        c
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b}
        len = self.length
        (0...len).each do |i|
            (i...len).each do |j|
                if prc.call(self[i], self[j]) == 1
                    self[i], self[j] = self[j], self[i]
                end
            end
        end
        self
    end
end
