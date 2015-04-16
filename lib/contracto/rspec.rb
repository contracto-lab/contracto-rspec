require 'contracto/rspec/version'
require 'contracto'

class Contracto::RSpec
  require_relative 'rspec/server_terminator'

  CONTRACTO_RSPEC_MODULES = [
    Contracto::RSpec::ServerTerminator
  ]

  def initialize(options)
    @url = options.fetch(:url)
  end

  def start!
    add_modules_to_rspec
    start_server
  end

  private

  def start_server
    Contracto::Command.run('start', [@url])
  end

  def add_modules_to_rspec
    RSpec.configure do |config|
      CONTRACTO_RSPEC_MODULES.each do |mod|
        config.include mod
      end
    end
  end

end

