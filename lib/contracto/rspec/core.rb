require 'fileutils'

class Contracto::RSpec::Core

  def initialize(options)
    @git_url = options[:git]
    @root_dir = options[:path]
    start!
  end

  private

  def start!
    add_modules_to_rspec
    start_server
  end

  def start_server
    if @root_dir
      Contracto::Config.root_dir = @root_dir
      Contracto::Command.run('start', [])
    elsif @git_url
      Contracto::Command.run('start', [@git_url])
    end
  end

  def add_modules_to_rspec
    require_relative 'server_terminator'
    require_relative 'json_helper'
  end

end