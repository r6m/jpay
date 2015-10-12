require "jpay/version"
require 'jpay/payment_request'
require 'jpay/response'
require 'jpay/payment_verification'
require 'jpay/errors'

module Jpay
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  # Configures the gem
  #
  # @example
  #   Jpay.configure do |config|
  #     config.merchant_id  = 'XXXXXXXX'
  #     config.callback_url = 'http://example.com/call_back'
  #     config.client       = 'http://www.jahanpay.com/webservice?wsdl'
  #   end
  class Configuration
    attr_accessor :api, :callback_url, :client

    def initialize
      @api = 'randome-api-xyz'
      @client = 'http://www.jahanpay.com/webservice?wsdl'
      @callback_url = 'localhost:3000/verify'
    end

  end
end
