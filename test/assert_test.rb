# frozen_string_literal: true

require "test_helper"

class AssertTest < Test::Unit::TestCase
  # NOTE: same as one in README
  ## Example1
  class Stack
    include ::Assert

    def initialize
      @store = []
    end

    def pop
      assert(!@store.empty?)
      @store.pop
    end

    def push(element)
      @store.push(element)
      self
    end
  end

  ## Example2
  class Stack
    def peek
      ::Assert.assert(!@store.empty?)
      @store.last
    end
  end

  def setup
    @stack = Stack.new
  end

  test "should provide only `assert(_*)` methods" do
    assertion_method_pattern = /\Aassert(?:_\w+)?\z/

    assert_empty(::Assert.instance_methods)
    assert(::Assert.private_instance_methods.all?(&assertion_method_pattern.method(:match?)))
  end

  sub_test_case("when using the assert methods in a class that mixin the module") do
    test "should raise `AssertionError` when the preconditions aren't satisfied" do
      assert_raise(::AssertionError) { @stack.pop }
    end

    test "should not raise any errors when the preconditions are satisfied" do
      @stack.push(42)
      assert_nothing_raised { @stack.pop }
    end
  end

  sub_test_case("when calling the assert methods with the module as a receiver") do
    test "should raise `AssertionError` when the preconditions aren't satisfied" do
      assert_raise(::AssertionError) { @stack.peek }
    end

    test "should not raise any errors when the preconditions are satisfied" do
      @stack.push(42)
      assert_nothing_raised { @stack.peek }
    end
  end
end
