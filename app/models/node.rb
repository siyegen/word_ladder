class Node

  # Cost of moving to this node
  attr_accessor :cost

  # Parent node stored for path
  attr_accessor :parent

  # Value at this node
  attr_accessor :value

  # List of nodes connected to this node
  attr_accessor :node_list

  def initialize(attributes = {})
    attributes.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end
end
