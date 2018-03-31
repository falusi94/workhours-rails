class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authorized?
    redirect_to :back unless current_user.admin?
  end
end
