class SessionsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      log_in user
      redirect_to root_path, notice: 'ログインしました。'
    else
      redirect_to root_path
    end
  end

  def destroy
    # reset_session
    log_out if logged_in?
    redirect_to root_path, notice: 'ログアウトしました。'
  end
 
  private
 
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
