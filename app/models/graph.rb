class Graph
  include HashInit

  # Hash of all nodes we want to search
  attr_accessor :nodes_hash

  # Raw List of values of nodes
  attr_accessor :raw_node_values

  def connect_nodes(connect_method)

    graph_size = raw_node_values.size
    for i in (0...graph_size)
      node = nodes_hash[raw_node_values[i]]
      j = i + 1
      for k in (j...graph_size)
        other_node = nodes_hash[raw_node_values[k]]
        if node.send(connect_method, other_node.value)
          node.add_node(other_node)
          other_node.add_node(node)
        end
      end
    end
  end

  def self.create(word_array, wrapper = nil)
    graph_nodes = {}
    raw_values = []
    word_array.sort!
    word_array.each do |word|
      raw_values << word
      node = Node.new({parent: nil, value: word, cost: Float::INFINITY})

      graph_nodes[word] =
        if wrapper.nil?
          node
        else
          wrapper.new(node)
        end
    end

    Graph.new({nodes_hash: graph_nodes, raw_node_values: raw_values})
  end

  def path(start)
    path = []
    return path if start.nil?

    current = start
    until current.nil?
      path << current
      current = current.parent
    end
    path.reverse
  end
end
