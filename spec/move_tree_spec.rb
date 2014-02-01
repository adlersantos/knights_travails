require 'spec_helper'

describe KnightsTravails::MoveTree do
  describe '#build_tree_from' do
    it "should produce 64 nodes from various starting positions" do
      move_tree = KnightsTravails::MoveTree.new([0, 0])
      expect(move_tree.nodes.size).to eq(64)

      move_tree = KnightsTravails::MoveTree.new([4, 4])
      expect(move_tree.nodes.size).to eq(64)

      move_tree = KnightsTravails::MoveTree.new([7, 5])
      expect(move_tree.nodes.size).to eq(64)
    end
  end
end