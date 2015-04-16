class Contracto::RSpec::Core

  require_relative 'server_terminator'

  CONTRACTO_RSPEC_MODULES = [
    Contracto::RSpec::ServerTerminator
  ]

  def initialize(options)
    @url = options.fetch(:url)
    start!
  end

  private

  def start!
    add_modules_to_rspec
    start_server
  end

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