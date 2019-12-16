# frozen_string_literal: true

require "forwardable"
require "test/unit/assertion-failed-error"

module StandardAssert
  class AssertionError < ::StandardError
    extend ::Forwardable

    OriginalError = ::Test::Unit::AssertionFailedError
    private_constant :OriginalError

    def_delegators(
      :@original_error,
      *(OriginalError.instance_methods - superclass.instance_methods)
    )

    class << self
      def to_s
        "AssertionError"
      end

      alias inspect to_s
      alias name to_s
    end

    def initialize(message = nil, options = nil)
      @original_error = OriginalError.new(message, options)
      super(@original_error.message)
    end
  end
end

AssertionError = StandardAssert::AssertionError
