class ApplicationController < ActionController::Base
    skip_forgery_protection
    helper_method :user, :logged_in?
  
    def user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!user
    end
  end
  