class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        session[:user_id]=user.id
        flash[:notice] = "Login successful!"
        redirect_to root_path
      else
        flash.now[:alert] = "username or password is incorrect"
        render 'new', status: :unprocessable_entity
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:notice] = "logged out successfully."
      redirect_to root_path
    end
  end
  