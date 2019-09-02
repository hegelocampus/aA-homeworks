class UsersController < ApplicationController
  def new
    @user = User.new
    render :create
  end

  def show
    @user = User.find_by(session_token: session[:session_token])
    if @user
      render :show
    else
      flash[:error] = "Please sign in before attempting to view that page"
      redirect_to session_new, status: 401 # sign in should go here when I have it
    end
  end
  
  def create
    raise 'no user params given' if params[:user].nil?
    @user = User.new(email: user_params[:email])
    @user.password = user_params[:password]
    if @user.save
      login_user!(@user)
      flash[:success] = "Account successfully created!"
      redirect_to user_url(@user.id) #maybe
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end

  rescue 
    redirect_to new_user_url
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
