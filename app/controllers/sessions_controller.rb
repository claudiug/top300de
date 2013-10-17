class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:login][:email]).first
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      flash[:notice] = "Login! with #{user.name}"
      #TODO remove the admin path when we are live, or work only and ONLY the user is admin
      redirect_to admin_dashboard_path #if user.is_admin?
    else
      render 'new'
      flash[:error] = "error!"
    end
  end
end
