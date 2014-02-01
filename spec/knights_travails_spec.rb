require 'spec_helper'

describe KnightsTravails do
  it "should find the correct path for a chess knight" do
    path = KnightsTravails.find_path([0, 0], [4, 2])
    expect(path).to eq([[0, 0], [2, 1], [4, 2]])

    path = KnightsTravails.find_path([6, 7], [7, 1])
    expect(path).to eq([[6, 7], [7, 5], [6, 3], [7, 1]])
  end
end