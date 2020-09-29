class Array
  def my_each(&prc)
    len = self.length
    len.times do |i|
      prc.call(self[i])
    end
    self
  end
end


class Array
    def my_select(&prc)
      selected = []
      self.my_each do |num|
          selected << num if prc.call(num)
      end
      selected
    end

    def my_reject(&prc)
      rejected = []
      self.my_each do |num|
          rejected << num if !prc.call(num)
      end
      rejected
    end

    def my_any?(&prc)
      self.my_each do |num|
          return true if prc.call(num)
      end
      false
    end

    def my_all?(&prc)
      self.my_each do |num|
          return false if !prc.call(num)
      end
      true
    end

    def my_flatten
      flattened = []
      self.my_each do |el|
          if !el.kind_of?(Array)
              flattened << el
          else
              flattened += el.my_flatten
          end
      end
      flattened
    end

    def my_zip(*arrs)
      zipped = []
      self.length.times do |i|
          tmp_arr = [self[i]]
          arrs.my_each do |arr|
              tmp_arr << arr[i]
          end
          zipped << tmp_arr
      end
      zipped
    end

    def my_rotate(val=1)
      new_arr = self[0..]
      if val > 0
          val.times { || new_arr << new_arr.shift }
      else
          (-val).times { || new_arr.unshift(new_arr.pop) }
      end
      new_arr
    end

    def my_join(delim="")
      str = ""
      self.length.times do |i|
          str += self[i]
          str += delim unless i == self.length - 1
      end
      str
    end
    
    def my_reverse
      reversed = []
      (self.length - 1).downto(0).each do |i|
          reversed << self[i]
      end
      reversed
    end
end


return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]

# ------------------------------------------------------------------

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

# ------------------------------------------------------------------

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# ------------------------------------------------------------------

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

# ------------------------------------------------------------------

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# ------------------------------------------------------------------

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# ------------------------------------------------------------------

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# ------------------------------------------------------------------

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

# ------------------------------------------------------------------

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
