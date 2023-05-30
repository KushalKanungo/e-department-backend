require 'googleauth/stores/file_token_store'
require 'googleauth'


class AuthService

  def self.verify(access_token)
    Google::Auth::IDTokens.verify_oidc access_token, aud: ENV['CLIENT_ID']
  end

end
