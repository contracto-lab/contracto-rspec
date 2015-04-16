require 'contracto/rspec/version'
require 'contracto'

module Contracto::RSpec

  def self.start!(options)
    require_relative 'rspec/core'
    Contracto::RSpec::Core.new(options)
  end

end

