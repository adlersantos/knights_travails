module KnightsTravails
  class MoveTree
    attr_accessor :visited_nodes

    def initialize(root_position)
      @root = Move.new(root_position)
      @visited_nodes = [@root]

      @root.generate_next_moves
      build_tree_from(@root)
    end

    private

    def build_tree_from(root, queue=[])
      next_move = root.children.detect { |child| !visited_positions.include?(child.value) }

      if next_move
        queue << next_move
        @visited_nodes << next_move
        build_tree_from(root, queue)
      else
        return if queue.empty?
        next_root = queue.shift
        next_root.generate_next_moves
        next_root.children.select! { |child| !visited_positions.include?(child.value) }
        build_tree_from(next_root, queue)
      end
    end

    def visited_positions
      @visited_nodes.map { |node| node.value }
    end
  end
end
