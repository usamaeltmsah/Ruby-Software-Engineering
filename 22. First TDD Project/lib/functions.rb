class Array
    def my_uniq
        Set.new(self).to_a
    end

    def two_sum
        pairs = []
        len = self.length
        (0...len).each do |i|
            (i+1...len).each do |j|
                if self[i] == -self[j]
                    temp_pair = [i, j]
                    pairs << temp_pair
                end
            end
        end
        pairs
    end
end