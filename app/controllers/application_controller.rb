class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Response
  include ExceptionHandler

  before_action :authenticate

  respond_to :json

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @auth = ApiKey.exists?(access_token: token)
    end
  end
end
