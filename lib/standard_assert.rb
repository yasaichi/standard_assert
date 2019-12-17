# frozen_string_literal: true

require "test/unit/assertions"
require_relative "standard_assert/assertion_error"
require_relative "standard_assert/version"

module StandardAssert
  using(::Module.new do
    assertions = ::Object.new.extend(::Test::Unit::Assertions.dup.tap do |mod|
      mod.module_exec do
        const_set :AssertionFailedError, ::AssertionError
      end
    end)

    refine ::StandardAssert do
      define_method(:assertions) { assertions }
    end

    # NOTE: It isn't working to call `define_singleton_method` in `refine ::StandardAssert` block
    refine ::StandardAssert.singleton_class do
      define_method(:assertions) { assertions }
    end
  end)

  ASSERTION_METHOD_PATTERN = /\Aassert(_.+)?\z/.freeze
  private_constant :ASSERTION_METHOD_PATTERN

  class << self
    def to_s
      "Assert"
    end

    alias inspect to_s
    alias name to_s
  end

  ::Test::Unit::Assertions.public_instance_methods
                          .select(&ASSERTION_METHOD_PATTERN.method(:match?))
                          .each do |name|
    class_eval <<~CODE, __FILE__, __LINE__ + 1
      module_function def #{name}(*args, &block)
        assertions.public_send(:#{name}, *args, &block)
      end
    CODE
  end
end

Assert = StandardAssert
