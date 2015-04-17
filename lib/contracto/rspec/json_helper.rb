require 'httparty'

module Contracto::RSpec::JsonHelper

  def compare_with_contract!
    req = Contracto::RSpec::JsonHelper::ContractRequest.new(request)
    expect(JSON.parse(response.body)).to eq(req.body)
  end

  class ContractRequest
    def initialize(request)
      @request = request
    end

    def body
      HTTParty.send(
        http_method,
        contract_server_url,
        query: params, headers: http_headers
      ).body
    end

    private

    def contract_server_url
      @request.original_url.gsub('www.example.com', "0.0.0.0:#{Contracto::Constants::PORT}")
    end

    def params
      @request.params.to_hash
    end

    def http_method
      @request.method.downcase
    end

    def http_headers
      @request.env.select {|k,v| k.start_with? 'HTTP_'}
    end
  end
end

RSpec.configure do |config|
  config.include Contracto::RSpec::JsonHelper, type: :request
end