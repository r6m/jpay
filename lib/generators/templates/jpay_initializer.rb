Jpay.configure do |config|

  # your jahanpay api
  config.api = "xxxxx"

  # your callback_url: example:
  # config.callback_url = verify_purchase_url
  config.callback_url = "localhost:3000"
  # you can send specific callback_url for every purchase if you want.
  # this means every purchase can have it's own callback_url.
  # you can do this by adding 'callback_url' arg to PaymentRequest.new() method
  # along with other args (amount, callback_url, order_id, text)

end