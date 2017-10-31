class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = if user_params[:username] != ''
              User.find_by(username: user_params[:username])
            else
              User.find_by(email: user_params[:email])
            end

    if @user.is_password?(user_params[:password])
      session[:session_token] = @user.session_token
    else
      flash.now[:errors] = ["invalid login info"]
      render :new
    end
  end

  def destroy
    current_user.reset_session
    session[:session_token] = nil
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
