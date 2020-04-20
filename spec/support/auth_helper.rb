module AuthHelper
  def http_login(access_token)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(access_token)
  end
end