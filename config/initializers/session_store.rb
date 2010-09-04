# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stakeon2_session',
  :secret      => 'ee60c94c7e098c096d4a12c38812f32aa3a448d982dd141041ab36c6c16ab43482979fa1ca22cb6e0fa56b77cd6d2c3fd47d7bc8bd51fa280d1528b527d9b575'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
