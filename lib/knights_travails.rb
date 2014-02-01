require "knights_travails/node"
require "knights_travails/move"
require "knights_travails/move_tree"
require "knights_travails/version"

module KnightsTravails
  def self.find_path(start_position, end_position)
    @move_tree = MoveTree.new(start_position)
    end_node = node_at(end_position)
    moves = [end_node]

    parent = end_node.parent
    until parent == nil
      moves.unshift(parent)
      parent = parent.parent
    end

    moves.map { |move| move.value }
  end

  private

  def self.node_at(position)
    @move_tree.nodes.detect { |node| node.value == position }
  end
end
