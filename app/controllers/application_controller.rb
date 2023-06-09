class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_ORIGINAL'] && password == ENV['BASIC_AUTH_PASSWORD_ORIGINAL']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :avatar, :last_name, :first_name, :last_name_hiragana, :first_name_hiragana,
                                             :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end
end
