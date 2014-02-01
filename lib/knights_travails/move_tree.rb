module KnightsTravails
  class MoveTree
    attr_accessor :nodes

    def initialize(root_position)
      @root = Move.new(root_position)
      @nodes = [@root]

      setup_new_vertex(@root)
      build_tree_from(@root)
    end

    private

    def build_tree_from(root, queue=[])
      next_move = root.children.detect { |child| !visited_positions.include?(child.value) }

      if next_move
        [queue, @nodes].each { |arr| arr << next_move }
        build_tree_from(root, queue)
      else
        return if queue.empty?
        next_root = queue.shift
        setup_new_vertex(next_root)
        build_tree_from(next_root, queue)
      end
    end

    def setup_new_vertex(node)
      node.build_next_moves
      node.children.select! { |child| !visited_positions.include?(child.value) }
    end

    def visited_positions
      @nodes.map { |node| node.value }
    end
  end
end
