class WordNode
  extend Forwardable

  # Node that this object wraps
  attr_accessor :inner_node

  def initialize(node)
    @inner_node = node
  end

  def one_char_diff(other)
    return false if value.size != other.size
    to_c_a.zip(other.chars).one? {|words| words[0] != words[1]}
  end

  def to_c_a
    value.chars.to_a
  end

  def_delegators :@inner_node, :cost, :parent, :value, :connected_nodes, :add_node
  def_delegators :@inner_node, :cost=, :parent=
end
