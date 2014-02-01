module KnightsTravails
  class MoveTree
    attr_accessor :visited_nodes

    def initialize(root_position)
      @root = Move.new(root_position)
      @visited_nodes = [@root]

      build_and_filter_next_moves(@root)
      build_tree_from(@root)
    end

    private

    def build_tree_from(root, queue=[])
      next_move = root.children.detect { |child| !visited_positions.include?(child.value) }

      if next_move
        [queue, @visited_nodes].each { |arr| arr << next_move }
        build_tree_from(root, queue)
      else
        return if queue.empty?
        next_root = queue.shift
        build_and_filter_next_moves(next_root)
        build_tree_from(next_root, queue)
      end
    end

    def build_and_filter_next_moves(node)
      node.build_next_moves
      node.children.select! { |child| !visited_positions.include?(child.value) }
    end

    def visited_positions
      @visited_nodes.map { |node| node.value }
    end
  end
end
