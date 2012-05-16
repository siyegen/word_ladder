class Graph
  include HashInit

  # List of all nodes we want to search
  attr_accessor :list_nodes

  def connect_nodes
    return [] if @list_nodes.nil?

    true
  end
end
