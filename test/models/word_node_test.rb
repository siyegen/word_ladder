require 'minitest_helper'

class WordNodeTest < MiniTest::Unit::TestCase
  def test_to_c_a
    word_node = WordNode.new(Node.new({value: 'cats'}))

    assert_equal word_node.to_c_a, ['c', 'a', 't', 's']
  end

  def test_one_char_diff
    word_node = WordNode.new(Node.new({value: 'cats'}))

    assert_equal true, word_node.one_char_diff('cabs')
    assert_equal false, word_node.one_char_diff('bars')
    assert_equal false, word_node.one_char_diff('bat')
  end
end
