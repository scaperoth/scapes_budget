Argyle.configure do |config|
  config.key = ENV['PLAID_PUBLIC']         # Public key from Plaid
  config.secret = ENV['PLAID_SECRET']   # Secret from Plaid
  config.customer_id = ENV['PLAID_CLIENT_ID']  # Client ID from Plaid
  config.product = "connect"
end