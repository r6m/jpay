require "savon"

module Jpay
  class PaymentRequest

    attr_accessor :amount, :order_id, :text
    attr_reader   :response

    # @note A hash of parametes should be send to this class
    # @example
    #   PaymentRequest.new(amount: 1000, callback_url: 'localhost:3000/verify', order_id: 12, text: 'sample text')
    #
    # @param args [Hash] hash of params to send requests
    # @option args [Integer] :amount price in Toman
    # @option args [String] :callback_url callback_url url for verification redirect
    # @option args [Integer] :order_id your order id
    # @option args [string] :text payment description

    def initialize(args = {})
      @api = args[:api] || Jpay.configuration.api
      @amount   = args[:amount]
      @callback_url = args[:callback_url] || Jpay.configuration.callback_url
      @order_id = args[:order_id]
      @text     = args[:text]
      @client ||= Savon.client(wsdl: Jpay.configuration.client, pretty_print_xml: true)
      @response = Response.new
    end

    def pay
      response = @client.call :requestpayment, message: {
        'api'      => @api,
        'amount'   => @amount,
        'callback' => @callback_url,
        'orderid'  => @order_id,
        'txt'      => @text
      }

      @response.validate(response.body)
    end

  end
end