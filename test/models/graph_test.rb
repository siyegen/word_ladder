require 'minitest_helper'

class GraphTest < MiniTest::Unit::TestCase
  def test_connect_nodes
    graph = Graph.create(['cat', 'bar', 'car', 'ban', 'can'])
    graph.connect_nodes
    cat_node = graph.list_nodes.select{|node| node.value == 'cat'}.first

    assert_equal 2, cat_node.connected_nodes.size
    ['can', 'car'].each do |word|
      assert_equal word, cat_node.connected_nodes.select{|node| node.value == word}.first.value
    end
  end
end
