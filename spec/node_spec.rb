require 'spec_helper'

describe Node do
  before :each do
    @a = Node.new(1)
    @b = Node.new(2, parent: @a)
    @c = Node.new(3, parent: @a)
    @d = Node.new(3, parent: @b)
    @e = Node.new(4, parent: @b)
    @f = Node.new(5, parent: @c)

    @a.add_child(@b)
    @a.add_child(@c)
    @b.add_child(@d)
    @b.add_child(@e)
    @c.add_child(@f)
  end

  it "should do depth-first-search correctly" do
    @a.dfs(3).should == @d
  end

  it "should do breadth-first-search correctly" do
    @a.bfs(3).should == @c
  end
end
