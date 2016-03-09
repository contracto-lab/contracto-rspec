require 'fileutils'

class Contracto::RSpec::Core

  def initialize(options = {})
    @git_url = options[:git]
    start!
  end

  private

  def start!
    add_modules_to_rspec
    start_server
  end

  def start_server
    args = []
    args << @git_url if @git_url
    Contracto::Command.run('start', args)
  end

  def add_modules_to_rspec
    require_relative 'server_terminator'
    require_relative 'json_helper'
  end

end
