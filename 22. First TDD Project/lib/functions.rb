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

    def pick_stocks
        best_pair = nil
        best_profit = 0

        self.each_index do |buy_date|
            self.each_index do |sell_date|
                # can't sell before buy
                next if sell_date < buy_date

                profit = self[sell_date] - self[buy_date]
                if profit > best_profit
                    best_pair = [buy_date, sell_date]
                    best_profit = profit
                end
            end
        end

        best_pair
    end
end