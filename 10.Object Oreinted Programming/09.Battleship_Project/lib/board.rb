class Board
    attr_reader :size
  def initialize(n)
    @grid = Array.new(n) { Array.new(n)}
    (0...n).each do |i|
         (0...n).each { |j| @grid[i][j] = :N }
    end
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts 'you sunk my battleship!'
        return true
    else
        self[pos] = :X
        return false
    end
  end
end
