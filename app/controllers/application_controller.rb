class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout(:choose_layout)

  def choose_layout
    if current_user
      current_user.type.downcase
    end
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user && session[:user_id]
  end

  def required_logged_in
    redirect_to '/' unless logged_in?
  end

end
