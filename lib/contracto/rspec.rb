require 'contracto/rspec/version'
require 'contracto'

module Contracto::RSpec
  require_relative 'rspec/core'

  def self.start!(options)
    Contracto::RSpec::Core.new(options)
  end
end

