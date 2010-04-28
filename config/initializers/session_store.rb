# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Stock_Portfolio_Optimization_session',
  :secret      => 'a4dd6f558591dfcf9d9191333ec6da19733c49110706533ae60e553b0fc87d955e622b452c4599171931d86d3e37a55e7f44dae9f855f3c2923b3f5e4f485a8c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
