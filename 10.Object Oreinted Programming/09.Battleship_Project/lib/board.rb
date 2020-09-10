class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n)}
    (0...n).each do |i|
         (0...n).each { |j| @grid[i][j] = :N }
    end
    @size = n * n
  end
end
