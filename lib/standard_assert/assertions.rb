# frozen_string_literal: true

require "minitest"
require "singleton"
require_relative "assertion_error"

module StandardAssert
  class Assertions # :nodoc:
    include ::Minitest::Assertions
    include ::Singleton

    def initialize
      @assertions = 0
    end

    # Override
    def assert(test, msg = nil)
      super
    rescue ::Minitest::Assertion => e
      raise ::AssertionError, e.message
    end

    protected # rubocop:disable Style/AccessModifierDeclarations

    attr_reader :assertions

    # NOTE: `Minitest::Assertions` expects to be able to increment an instance accessor named
    # `assertions`, but we don't need the accessor because it's for reporting test results.
    # So define the writer that does nothing and returns a constant value.
    def assertions=(_val)
      @assertions
    end
  end
end
