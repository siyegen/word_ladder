class GraphSolver
  # Beginning of word graph to solver for
  attr_accessor :start_word

  # End of word graph we're trying to reach
  attr_accessor :end_word

  # Array of words to solve with
  attr_accessor :words

  def initialize(start_word, end_word, words)
    @start_word = start_word
    @end_word = end_word
    @words = words
  end

  # Solves shortest distance and returns
  # total_cost of moving
  # start_word
  # end_word
  # path of nodes
  def solve
    graph = Graph.create(words, WordNode)
    graph.connect_nodes(:one_char_diff)

    end_node = graph.nodes_hash[end_word]
    start_node = graph.nodes_hash[start_word]
    start_node.cost = 0

    heap = Containers::Heap.new { |a, b| (a.cost <=> b.cost) == -1 }
    graph.nodes_hash.each do |k, v|
      heap.push v
    end

    puts heap.size
    # puts "is empty?#{heap.empty?}"
    until heap.empty? do
      current_node = heap.pop
      puts current_node.value, current_node.cost
      # puts current_node == end_node
      # puts current_node.value, end_node.value
      return graph.path(end_node) if current_node == end_node

      current_node.connected_nodes.each do |node|

        # puts node.visited
        unless node.visited
          cost = current_node.cost + 1
          if cost < node.cost
            node.cost = cost
            node.parent = current_node
            # puts "changed parent"
            # puts node.parent
          end
        end
      end

      current_node.visited = true
    end
  end
end
