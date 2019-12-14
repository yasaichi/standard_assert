require "test/unit/assertions"

module Assertions
  %i(public protected private).each do |visibility|
    ::Test::Unit::Assertions.public_send("#{visibility}_instance_methods", false).each do |name|
      define_method(name, ::Test::Unit::Assertions.instance_method(name))
      __send__(visibility, name)
    end
  end
end
