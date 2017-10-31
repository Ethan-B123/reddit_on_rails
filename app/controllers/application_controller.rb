class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_login
    if current_user.nil?
      redirect_to new_session_url
    end
  end
end
