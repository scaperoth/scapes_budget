Argyle.configure do |config|
  config.key = ENV['plaid_public']         # Public key from Plaid
  config.secret = ENV['plaid_secret']   # Secret from Plaid
  config.customer_id = ENV['plaid_client_id']  # Client ID from Plaid
  config.product = "connect"
end