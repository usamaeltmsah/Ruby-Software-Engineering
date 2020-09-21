class Array
    def my_each(&prc)
        prc.call(self)
        self
    end
end


return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]