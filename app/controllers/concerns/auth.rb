module Auth
  # require 'googleauth'
  extend ActiveSupport::Concern

  def verify_id_token(id_token)
    # Create a Google authorization client
    client_id = '101242721034-svf9du5sbf1rehbmjqukg907v03p25dt.apps.googleusercontent.com'
    client_secret = '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'
    scope = 'openid email'  # Include the required scopes for your application
    authorization = Google::Auth::ClientBuilder.new
    .client_id(client_id)
    .client_secret(client_secret)
    .scope(scope)
    .build

    # Verify the ID token
    validator = authorization.validator
    claim = validator.check(id_token)

    if claim
      # The ID token is valid
      # Perform further processing or validation if needed
      return true
    else
      # The ID token is invalid
      return false
  end
end

end
