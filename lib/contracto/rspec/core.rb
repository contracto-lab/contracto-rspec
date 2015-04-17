require 'fileutils'

class Contracto::RSpec::Core

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
    require_relative 'server_terminator'
    require_relative 'json_helper'
  end

end