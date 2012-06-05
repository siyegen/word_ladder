class Graph
  include HashInit

  # Hash of all nodes we want to search
  attr_accessor :nodes_hash

  # Raw List of values of nodes
  attr_accessor :raw_node_values

  def connect_nodes(connect_method)
    nodes_hash.each_with_index do |node_a, index|
      index += 1
      node = node_a[1]
      for i in (index...raw_node_values.size)
        if node.send(connect_method, raw_node_values[i])
          matched_node = nodes_hash[raw_node_values[i]]
          node.add_node(matched_node)
          matched_node.add_node(node)
        end
      end
    end
  end

  def self.create(word_array, wrapper = nil)
    graph_nodes = {}
    raw_values = []
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
end
