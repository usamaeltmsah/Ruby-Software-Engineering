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
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]