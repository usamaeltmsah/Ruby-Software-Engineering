class Board
    attr_reader :size
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N)}
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
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

  def place_random_ships
    quart_size = size * 0.25
    len = @grid.length
    while self.num_ships < quart_size
      rand1 = rand(0...len)
      rand2 = rand(0...len)
      @grid[rand1][rand2] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |r|
      r.map do |el|
        if el == :S
          :N
          else
            el
        end
      end
    end
  end

  def self.print_grid(grid)
    grid.each { |sub_arr| puts sub_arr.join(" ")}
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end