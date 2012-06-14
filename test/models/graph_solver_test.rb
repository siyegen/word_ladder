require 'minitest_helper'

class GraphSolverTest < MiniTest::Unit::TestCase
  def test_solve_graph
    test_words = ['cat', 'bat', 'ban', 'can', 'ran', 'rap', 'tap']

    answer = GraphSolver.new('cat', 'tap', test_words).solve
    temp = answer.map { |node| node.value }
    puts temp.inspect
    assert_equal 5, answer.size
    assert_equal 'cat', answer.first.value
    assert_equal 'tap', answer.last.value
    assert_equal ['cat', 'can', 'ran', 'rap', 'tap'], temp
  end

  def test_super_solve_graph
    # test_words = []
    # File.open('/usr/share/dict/words', 'r').readlines.each do |word|
    #   test_words.push(word.chomp) if word.chomp.size == 6
    # end

    # test_words =


    # answer = GraphSolver.new('warmer', 'colder', test_words).solve
    # temp = answer.map { |node| node.value }
    # puts temp.inspect
    # assert_equal 5, answer.size
    # assert_equal 'warmer', answer.first.value
    # assert_equal 'colder', answer.last.value
    # assert_equal ['cat', 'can', 'ran', 'rap', 'tap'], temp
  end
end
