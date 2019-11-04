class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])

    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end
  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to login_url
  end
end
