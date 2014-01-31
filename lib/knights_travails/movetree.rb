module KnightsTravails
  class MoveTree
    def initialize(root_position)
      @root = Move.new(root_position)
      build_move_tree
    end

    def build_tree # I stopped here, build a tree of moves coming from the position of @root.value
      @root.generate_new_moves
      @visited_positions = @root.children
      vertex = @root
      until @visited_positions.size == 63
        next_node = vertex.children.detect { |child| !@visited_positions.include?(child.value) }
        next_node.generate_new_moves
      end
    end
  end
end
