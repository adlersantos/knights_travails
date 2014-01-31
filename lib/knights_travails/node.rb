class Node
  attr_accessor :value, :parent, :children

  def initialize(value, **opts)
    @value = value
    @parent = opts[:parent]
    @children = opts[:children] || []
  end

  def remove_child(child_node)
    @children.delete(child_node)
    child_node.remove_parent
  end

  def add_child(child_node)
    previous_parent = child_node.parent
    previous_parent.remove_child(child_node) if previous_parent
    child_node.parent = self
    self.children << child_node
  end

  def remove_parent
    @parent = nil
  end

  def dfs(value, stack=[self], visited_nodes=[self])
    return self if @value == value

    next_node = @children.detect { |node| !visited_nodes.include?(node) }

    if next_node.nil?
      stack.pop
      return nil if stack.empty?
      stack.last.dfs(value, stack, visited_nodes)
    else
      [stack, visited_nodes].each { |arr| arr << next_node }
      next_node.dfs(value, stack, visited_nodes)
    end
  end

  def bfs(value, queue=[], visited_nodes=[self])
    return self if @value == value

    next_node = @children.detect { |node| !visited_nodes.include?(node) }

    if next_node
      return next_node if @value == next_node.value
      [queue, visited_nodes].each { |arr| arr << next_node }
      self.bfs(value, queue, visited_nodes)
    else
      return nil if queue.size == 1
      queue.shift.bfs(value, queue, visited_nodes)
    end
  end
end
