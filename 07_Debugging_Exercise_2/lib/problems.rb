# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
    require 'prime'
    num.downto(2) do |factor|
        #debugger
        return factor if num % factor == 0 && factor.prime?
    end 
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char { |ch| hash[ch] += 1}

    return true if hash.none? { |k, v| v > 1 }
    return false
end

def dupe_indices(arr)
    count = Hash.new(0)
    hash = Hash.new {|h,k| h[k] = Array.new }
    arr.each { |el| count[el] += 1}
    #debugger
    arr.each_with_index { |el, i| hash[el] << i if count[el] > 1 }
    hash
end

def ana_array(arr1, arr2)
    arr1_includes_arr2_elements = arr1.all? { |el| arr2.include?(el) }
    arr2_includes_arr1_elements = arr2.all? { |el2| arr1.include?(el2) }
    return true if arr1_includes_arr2_elements && arr2_includes_arr1_elements

    return false
end