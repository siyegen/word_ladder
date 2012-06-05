require 'minitest_helper'

class GraphSolverTest < MiniTest::Unit::TestCase
  def test_solve_graph
    test_words = ['cat', 'bat', 'ban', 'can', 'ran', 'rap', 'tap']

    answer = Solver.new('cat', 'tap', test_words).solve
    assert_equal 'cat', answer.path.first.value
    assert_equal 'tap', answer.path.last.value
    assert_equal ['cat', 'can', 'ran', 'rap', 'tap'], answer.path
  end
end
