# frozen_string_literal: true

require 'sorbet'
require 'sorbet-runtime'

extend T::Sig

sig{params(name: String).returns(Integer)}
def foo(name)
  name.length
end

foo(45)
