# frozen_string_literal: true

require "test/unit/assertions"

module Assert
  %i[public protected private].each do |visibility|
    ::Test::Unit::Assertions.public_send("#{visibility}_instance_methods").each do |name|
      define_method name, ::Test::Unit::Assertions.instance_method(name)
      __send__(visibility, name)
    end
  end
end
