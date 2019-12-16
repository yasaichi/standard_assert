# frozen_string_literal: true

require "test/unit/assertions"
require_relative "standard_assert/assertion_error"
require_relative "standard_assert/version"

Test::Unit.class_exec do
  remove_const :AssertionFailedError
  const_set :AssertionFailedError, AssertionError
end

module StandardAssert
  class << self
    def to_s
      "Assert"
    end

    alias inspect to_s
    alias name to_s
  end

  %i[public protected private].each do |visibility|
    ::Test::Unit::Assertions.public_send("#{visibility}_instance_methods").each do |name|
      define_method name, ::Test::Unit::Assertions.instance_method(name)
      __send__(visibility, name)
    end
  end
end

Assert = StandardAssert
