# Contracto/RSpec

Supported by [![EL Passion](https://img.shields.io/badge/EL-Passion-36b452.svg)](https://github.com/elpassion) :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contracto-rspec'
```

And then execute:

    $ bundle

## Usage

- Add following lines in your `rails_helper.rb`:
```ruby
require 'contracto/rspec'

RSpec.configure do |config|
  Contracto::RSpec.start!(git: 'https://github.com/{github_user}/{contract_repository_name}.git')
  #...
end
```

<br>
- Test your API request by comparing its responses to contract responses:

```ruby
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it do
      get users_path
      compare_json_with_contract!(ignore: [:id])
    end
  end

  describe 'GET /users/:id' do
    it do
      get user_path(User.first)
      compare_json_with_contract!(ignore: [:created_at, :updated_at])
    end
  end
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/contracto-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
