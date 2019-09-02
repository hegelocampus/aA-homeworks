class SessionsController < ApplicationController
  def new
    @user = User.new 
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:email], params[:password])

    if @user
      login_user!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = "Wrong email/password combo"
      render :new, status: 401
    end
  end

  def destroy
    @user = User.find_by(session_token: session[:session_token])

    user.reset_session_token!
    session[:session_token] = nil
    redirect_to user_url
  end
end
