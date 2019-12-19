# frozen_string_literal: true

require_relative "standard_assert/assertions"
require_relative "standard_assert/version"

module StandardAssert
  assertion_method_pattern = /\Aassert(?:_\w+)?\z/

  ::StandardAssert::Assertions.instance
                              .public_methods
                              .select(&assertion_method_pattern.method(:match?))
                              .each do |name|
    class_eval <<~CODE, __FILE__, __LINE__ + 1
      module_function def #{name}(*args, &block)
        ::StandardAssert::Assertions.instance.public_send(:#{name}, *args, &block)
      end
    CODE
  end
end

# HACK: Call `dup` to make `inspect`, `name`, `to_s` and so on return `"Assert"`
Assert = StandardAssert.dup
