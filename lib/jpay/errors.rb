module Jpay
  module Errors
    IDS = {
      '-32' => 'Amount does not match',
      '-31' => 'Unsuccessful transaction',
      '-30' => 'Invalid transaction',
      '-29' => 'CallBack was not specified',
      '-27' => 'your IP is blocked',
      '-26' => 'Gateway is deactivated',
      '-24' => 'Invalid amount',
      '-23' => 'Too much amount',
      '-22' => 'Amount should be greater than 100 Toman',
      '-21' => 'Invalid IP for this Gateway',
      '-20' => 'Invalid API',
      '-6'  => 'Bank connection error',
      '-9'  => 'System error',
    }
  end
end