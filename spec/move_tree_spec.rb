require 'spec_helper'

describe KnightsTravails::MoveTree do
  describe '#build_tree_from' do
    it "should produce 64 visited nodes" do
      move_tree = KnightsTravails::MoveTree.new([0,0])
      expect(move_tree.visited_nodes.size).to eq(64)
    end
  end
end