# Jpay

### JahanPay payment gateway gem for rails

the Jpay gem provides Ruby APIs for proccessing payments, transactions and verifications using JahanPay's Merchant APIs. For more information please visit [JahanPay](http://jahanpay.com) website/

##### NOTE: [Jpay](https://github.com/rezam90/jpay) is highly inspired by [Zarinpal](https://github.com/arashm/zarinpal) gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jpay'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install jpay
```

## Configuration

```sh
rails g jpay:install
```

Configure 'config/initializers/jpay.rb':

```ruby
Jpay.configure do |config|

  config.api = "xxxxx" # your jahanpay api
  config.callback_url = "localhost:3000/verify"

end
```

## Example

Payment Request:

```ruby
class PurchaseController < ApplicationController
  ...
  def payment
    ...
    # payment request action
    requeset = Jpay::PaymentRequest.new({
      amount: 100, # must be in toman
      order_id: 1, # your order id
      text: 1, # any description for your order
      # callback_url: 'localhost:3000/verifyProducts' #this is not needed as you already defined callback url in 'config/initializers/jpay.rb'
      # but you can define it for every purchase if you want to have different callbacks for every purchase
    })

    response = request.pay
    response.valid?
    # if response is valid, it returns your jahanpay invoice number (response.invoice).
    # you must redirect_to "http://jahanpay.com/pay_invoice/#{response.invoice}"
    # or you can do as following:
    redirect_to response.url if response.valid?
    # this will redirect user to jahanpay.
  end
end
```
Payment Verification:

```ruby
class PurchaseController < ApplicationController
  ...
  # verify callback action
  def verify
    # jahanpay sends 'authority' code to your callback_url by GET method as 'au' param
    authority_code = params[:au]

    verification = Jpay::PaymentVerification.new({
      amount: 100, # must be equal to request amount
      authority: authority_code
    })

    response = verification.verify

    response.status   # return 1 for successful transaction, error number for unsuccessful one
    response.message  # returns status message
    response.valid?   # returns 'true' for successful transaction
  end

end
```

## Contributing

1. Fork it ( http://github.com/rezam90/jpay/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


##Copyright
Copyright © 2015 Reza Morsali.