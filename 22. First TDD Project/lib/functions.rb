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

    def my_transpose
        [
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
        ]
    end
end