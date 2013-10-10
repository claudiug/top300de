class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:login[:email]]).first
    if user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      flash[:notice] = "Login! with #{user.name}"
      redirect_to root_path
    else
      render 'new'
      flash[:error] = "error!"
    end
  end
end
