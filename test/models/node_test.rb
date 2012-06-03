require 'minitest_helper'

class NodeTest < MiniTest::Unit::TestCase
  def test_add_node
    main_node = Node.new({parent: nil, value: '', cost: Float::INFINITY})
    node = Node.new({parent: nil, value: 'cow', cost: Float::INFINITY})

    main_node.add_node(node)
    assert_equal node, main_node.connected_nodes.first
  end
end
