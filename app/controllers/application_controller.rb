class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authorized?
    redirect_to :back unless current_user.admin?
  end

  private
    def require_login
      redirect_to login_path unless session[:user_id] || ENV['NONAUTH']
    end

end
