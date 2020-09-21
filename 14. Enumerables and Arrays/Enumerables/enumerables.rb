class Array
    def my_each
        len = self.length
        i = 0
        while i < len
            yield self[i]
            i += 1
        end
        self
    end
end


return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]