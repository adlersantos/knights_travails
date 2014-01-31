require "knights_travails/node"
require "knights_travails/version"

module KnightsTravails
  class KnightMove < Node
    MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]

    def x_value
      @value[0]
    end

    def y_value
      @value[1]
    end

    def generate_new_moves
      moves = MOVES.collect { |move| [x_value + move[0], y_value + move[1]] }
      valid_moves = moves.select { |move| validate_position(move) }
      @children = valid_moves.map { |move| KnightMove.new(move) }
    end

    private

    def validate_position(move)
      move.each { |coord| return false unless (coord >= 0 && coord < 8) }
      true
    end
  end
end
