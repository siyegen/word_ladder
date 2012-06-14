class Node
  include HashInit

  # Cost of moving to this node
  attr_accessor :cost

  # Parent node stored for path
  attr_accessor :parent

  # Value at this node
  attr_accessor :value

  # List of nodes connected to this node
  attr_accessor :connected_nodes

  # Has this node already been visited?
  attr_accessor :visited

  def add_node(node)
    @connected_nodes ||= []
    @connected_nodes << node
  end
end
