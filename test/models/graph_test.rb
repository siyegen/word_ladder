require 'minitest_helper'

class GraphTest < MiniTest::Unit::TestCase
  def test_graph_create
    word_graph = Graph.create(['moo', 'meow'], WordNode)
    graph = Graph.create(['moo', 'meow'])

    assert_equal WordNode, word_graph.nodes_hash.first[1].class
    assert_equal Node, graph.nodes_hash.first[1].class
  end

  def test_connect_nodes
    graph = Graph.create(['cat', 'bar', 'car', 'ban', 'can', 'bat'], WordNode)
    graph.connect_nodes(:one_char_diff)
    cat_node = graph.nodes_hash['cat']
    ban_node = graph.nodes_hash['ban']
    bat_node = graph.nodes_hash['bat']

    # temp = cat_node.connected_nodes.map { |n| n.value}
    assert_equal 3, cat_node.connected_nodes.size

    assert_equal 3, cat_node.connected_nodes.size
    ['can', 'car', 'bat'].each do |word|
      assert_equal true, cat_node.connected_nodes.one? {|node| node.value == word}
    end
    assert_equal false, cat_node.connected_nodes.one? {|node| node.value == 'ban'}
    assert_equal false, ban_node.connected_nodes.one? {|node| node.value == 'cat'}
    assert_equal true, bat_node.connected_nodes.one? {|node| node.value == 'cat'}
  end

  def test_big_connect_nodes
    words = []
    File.open('/usr/share/dict/words', 'r').readlines.each do |word|
      words.push(word.chomp) if word.chomp.size == 6
    end
    puts words.size
    graph = Graph.create(words, WordNode)
    graph.connect_nodes(:one_char_diff)

    assert_equal words.size, 17706
    assert_equal graph.nodes_hash.size, 17706
  end

  def test_path
    nodes = []

    (0..3).each do |n|
      nodes.push Node.new({cost: 0, value: n})
      nodes[n].parent = nodes[n-1] unless n == 0
    end

    graph = Graph.new
    path = graph.path(nodes.last)

    assert_equal nodes.map { |n| n.value }, path.map { |n| n.value}
  end
end