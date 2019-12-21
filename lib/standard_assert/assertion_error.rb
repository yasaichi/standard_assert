# frozen_string_literal: true

module StandardAssert
  class AssertionError < ::StandardError; end
end

# HACK: Call `dup` to make `inspect`, `name`, `to_s` and so on return `"AssertionError"`
AssertionError = StandardAssert::AssertionError.dup
