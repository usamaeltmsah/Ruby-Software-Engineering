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

    def lose?
        return false if @remaining_misses > 0
        puts 'you lose'
        return true
    end

    def win?
        return false if self.board.num_ships > 0
        print 'you win'
        return true
    end
end
