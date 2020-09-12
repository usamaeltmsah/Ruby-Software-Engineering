def zip(*arrs)
    two_d_arr = Array.new(arrs[0].length) { Array.new(0) }
    arrs.each do |arr| 
        arr.each_with_index { |el, i| two_d_arr[i] << el }
    end
    two_d_arr
end