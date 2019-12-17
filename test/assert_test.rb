# frozen_string_literal: true

require "test_helper"

class AssertTest < Test::Unit::TestCase
  # NOTE: same as one in README
  module MyMath
    extend ::Assert

    module_function def abs(num)
      assert_instance_of([::Float, ::Integer, ::Rational], num)
      num.positive? ? num : -num
    end
  end

  test "should provide only `assert(_*)` methods" do
    assertion_method_pattern = /\Aassert(_.+)?\z/

    assert_empty(Assert.instance_methods)
    assert(Assert.private_instance_methods.all?(&assertion_method_pattern.method(:match?)))
  end

  test "should raise `AssertionError` when the preconditions aren't satisfied" do
    assert_raise(AssertionError) { MyMath.abs("42") }
  end

  test "should not raise any errors when the preconditions are satisfied" do
    assert_equal(42, MyMath.abs(-42))
  end
end
