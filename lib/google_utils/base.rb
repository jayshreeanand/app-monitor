require 'google/apis/androidpublisher_v2'

module GoogleUtils
  class Base
    key = OpenSSL::PKey::RSA.new(Rails.application.secrets.google_private_key, Rails.application.secrets.google_private_key_secret)
    scopes = ['https://www.googleapis.com/androidpublisher']
    @@authorization = Signet::OAuth2::Client.new(
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      audience: 'https://accounts.google.com/o/oauth2/token',
      scope: 'https://www.googleapis.com/auth/androidpublisher',
      issuer: Rails.application.secrets.google_service_account_email,
      signing_key: key
    )
  end
end