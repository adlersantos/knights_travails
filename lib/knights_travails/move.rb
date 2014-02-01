# require_relative './node'

module KnightsTravails
  class Move < Node
    MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]

    def x_value
      @value[0]
    end

    def y_value
      @value[1]
    end

    def build_next_moves
      moves = MOVES.collect { |move| [x_value + move[0], y_value + move[1]] }
      valid_moves = moves.select { |move| validate_position(move) }
      @children = valid_moves.map { |move| Move.new(move, parent: self) }
    end

    def children_values
      @children.map { |child| child.value }
    end

    private

    def validate_position(move)
      move.each { |coord| return false unless (coord >= 0 && coord < 8) }
      true
    end
  end
end