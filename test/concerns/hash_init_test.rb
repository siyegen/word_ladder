require 'minitest_helper'

class StubbedHash
  include HashInit
  attr_accessor :value
  attr_accessor :terp
end

class HashInitTest < MiniTest::Unit::TestCase
  def test_valid_attrs
    sh = StubbedHash.new({value: 1, terp: 'moo'})
    assert_equal 1, sh.value
    assert_equal 'moo', sh.terp
  end

  def test_not_valid_attrs
    sh = StubbedHash.new({kid: 42, cup: 'rawr'})
    assert_equal false, sh.instance_variable_defined?(:@kid)
    assert_equal false, sh.instance_variable_defined?(:@cup)
  end
end
