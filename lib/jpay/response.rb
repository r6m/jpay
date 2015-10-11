module Jpay
  class Response
    class ResponseError << RuntimeError; end
    attr_reader :response, :invoice, :status

    # Checks if the transaction response returned from PaymentRequest
    # or PaymentVerification is valid
    #
    # @param [#response Hash]
    # @raise [ArgumentError] if response is nil
    # @raise [ResponseError] if response is not valid
    # @return [Response]
    def validate(response = nil)
      @response = response
      perform_validation

      return self
    end

    # Returns the validation status of response
    #
    # @return [boolean]
    def valid?
      @valid
    end

    private
    def perform_validation
      raise ArgumentError, 'Not a valid response' if @response.nil?

      body    = @response[:requestpayment_response] || @response[:verification_response]
      @status = body[:return].to_i

      if body[:return].to_i < 0
        @valid = false
        raise ResponseError, Errors::IDS[body[:return]]
      elsif body[:return].to_i == 1
        @valid = true
      else
        @valid = true
        @invoice = body[:return]
      end
    end
  end
end