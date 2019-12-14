require "forwardable"
require "test/unit/assertion-failed-error"

class AssertionFailedError < StandardError
  extend ::Forwardable

  OriginalError = ::Test::Unit::AssertionFailedError
  private_constant :OriginalError

  def_delegators(
    :@original_error,
    *(OriginalError.instance_methods - superclass.instance_methods)
  )

  def initialize(message = nil, options = nil)
    @original_error = OriginalError.new(message, options)
    super(@original_error.message)
  end
end

Test::Unit.class_exec do
  remove_const :AssertionFailedError
  const_set :AssertionFailedError, ::AssertionFailedError
end
