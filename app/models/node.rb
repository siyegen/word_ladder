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
end
