class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_reign
    @current_reign ||= Reign.last
  end
  helper_method :current_reign

  def current_monarch
    if current_reign
    @current_monarch ||= @current_reign.user
    end
  end
  helper_method :current_monarch

end
