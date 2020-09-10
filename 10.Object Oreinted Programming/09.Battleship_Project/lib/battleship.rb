require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        size = n * n
        @board = Board.new(n)
        @remaining_misses = 0.5 * size
    end

    def start_game
        self.board.place_random_ships
        puts self.board.num_ships
        self.board.print
    end
end
