class SessionsController < ApplicationController
  skip_before_action :require_login
  before_action :require_logout, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params['username'])
    return redirect_to login_path unless user
    return redirect_to login_path unless user.try(:authenticate, params['password'])
    session[:user_id] = user.id
    return redirect_to '/projects'
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
