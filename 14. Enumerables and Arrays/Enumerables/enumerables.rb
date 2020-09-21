class Array
    def my_each(&prc)
        len = self.length
        i = 0
        while i < len
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each do |num|
            arr << num if prc.call(num)
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each do |num|
            arr << num if !prc.call(num)
        end
        arr
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