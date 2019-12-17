# frozen_string_literal: true

require "test/unit/assertions"
require_relative "standard_assert/assertion_error"
require_relative "standard_assert/version"

module StandardAssert
  using(::Module.new do
    refine ::StandardAssert do
      (mod = ::Test::Unit::Assertions.dup).module_exec do
        const_set :AssertionFailedError, ::AssertionError
      end

      define_method(:assertions) { @assertions ||= ::Object.new.extend(mod) }
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
      private def #{name}(*args, &block)
        assertions.public_send(:#{name}, *args, &block)
      end
    CODE
  end
end

Assert = StandardAssert
