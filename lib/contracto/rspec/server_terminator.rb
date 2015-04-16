module Contracto::RSpec::ServerTerminator

  ::RSpec.configure do |config|

    config.after(:suite) do
      Contracto::Command.run('stop', [])
    end

  end

end