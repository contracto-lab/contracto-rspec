require 'httparty'

module Contracto::RSpec::JsonHelper

  def compare_json_with_contract!(options = {})
    @contracto_rspec_options = options
    expected_json = contract_response.to_json
    given_json = api_response.to_json
    
    expect(given_json).to eq(expected_json)
  end

  def api_response
    Response.new(response.body, @contracto_rspec_options)
  end

  def contract_response
    Response.new(
      Contracto::RSpec::JsonHelper::ContractRequest.new(request).body,
      @contracto_rspec_options
    )
  end

  class Response
    def initialize(body, options = {})
      @body = body
      @options = options
    end

    def to_json
      JSON.parse(@body).tap do |json|
        @json = json
        parse_json_with_options
      end
      @json
    end
    
    def parse_json_with_options
      if @options[:ignore]
        if @json.is_a?(Array)
          @json.each do |json|
            @options[:ignore].each do |key|
              json.delete(key.to_s)
            end
          end
        else
          @options[:ignore].each do |key|
            @json.delete(key.to_s)
          end
        end
      end
    end
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