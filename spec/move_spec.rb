require 'spec_helper'

describe KnightsTravails::Move do
  before :each do
    @move = KnightsTravails::Move.new([0, 0])
    @move.generate_next_moves
    @children_values = @move.children.map { |child| child.value }
  end

  describe "#generate_next_moves" do
    it "should set only the valid moves to the children's values" do
      expect(@children_values).to include([1, 2], [2, 1])
      @children_values.should_not include([-1, -2], [0, 0])
    end

    it "should set a move's children to be Move objects" do
      @move.children.each do |child|
        expect(child.class).to eq(KnightsTravails::Move)
      end
    end
  end
end