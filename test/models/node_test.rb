require 'minitest_helper'

class NodeTest < MiniTest::Unit::TestCase
  def test_valid_attrs
    node = Node.new({cost: 0, value: 'Node'})
    assert_equal 0, node.cost
    assert_equal 'Node', node.value
  end

  def test_not_valid_attrs
    node = Node.new({moo: 0, cow: 'Node'})
    assert_equal nil, node.cost
    assert_equal nil, node.value
  end
end
