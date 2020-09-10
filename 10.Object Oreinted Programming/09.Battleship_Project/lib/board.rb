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

  def place_random_ships
    quart_size = size / 4
    i = 0
    while i < quart_size
      rand1 = rand(0..Math.sqrt(quart_size))
      rand2 = rand(0..Math.sqrt(quart_size))
      if @grid[rand1][rand2] != :S
        @grid[rand1][rand2] = :S
        i += 1
      end
    end
  end

  def hidden_ships_grid
    new_arr = []
    @grid.each do |sub_arr|
      new_sub = []
      sub_arr.each do |el|
        if el == :S
          new_sub << :N
        else
          new_sub << el
        end
      end
      new_arr << new_sub
    end
    new_arr
  end

  def self.print_grid(grid)
    grid.each { |sub_arr| puts sub_arr.join(" ")}
  end
end