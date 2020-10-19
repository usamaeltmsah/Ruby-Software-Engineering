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
        dim = self[0].length
        cols = Array.new(dim) { Array.new(dim) }

        dim.times do |i|
            dim.times do |j|
                cols[j][i] = self[i][j]
            end
        end

        cols
    end
end