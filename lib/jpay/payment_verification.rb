require "savon"

module Jpay
  # Verifies transaction with jahanpay
  class PaymentVerification
    attr_reader :status

    # @note A hash of parameters should be send to this class
    # @example
    #   PaymentVerification.new(authority: 'xxx-xxx', amount: 10000)
    #
    # @param args [Hash] hash of params to verify transaction
    # @option args [String] :authority Authority code returned by verify url params
    # @option args [Integer] :amount price of the request
    def initialize(args = {})
      @authority = args.fetch(:authority)
      @amount    = args.fetch(:amount)
      @client  ||= Savon.client(wsdl: Zarinpal.configuration.client, pretty_print_xml: true)
      @response  = Response.new
    end

    # Send verification request to jahanpay
    #
    # @return [Jpay::Response]
    def verify
      response = @client.call :verification, message: {
        'api' => Jpay.configuration.jpay_api,
        'amount' => @amount,
        'authority' => @authority,
      }
      @response.validate(response.body)
    end
  end
end