# frozen_string_literal: true

require "test_helper"

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

describe Assert do
  before do
    @stack = Stack.new
  end

  it "should provide only `assert` and `assert_*` methods" do
    assertion_method_pattern = /\Aassert(?:_\w+)?\z/

    assert_empty(::Assert.instance_methods)
    assert(::Assert.private_instance_methods.all?(&assertion_method_pattern.method(:match?)))
  end

  describe "when using the assert methods in a class that mixin the module" do
    it "should raise `AssertionError` when the preconditions aren't satisfied" do
      assert_raises(::AssertionError) { @stack.pop }
    end

    it "should not raise any errors when the preconditions are satisfied" do
      @stack.push(value = 42)
      assert_equal value, @stack.pop
    end
  end

  describe "when calling the assert methods with the module as a receiver" do
    it "should raise `AssertionError` when the preconditions aren't satisfied" do
      assert_raises(::AssertionError) { @stack.peek }
    end

    it "should not raise any errors when the preconditions are satisfied" do
      @stack.push(value = 42)
      assert_equal value, @stack.peek
    end
  end
end
