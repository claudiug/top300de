class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def request_login
    if current_user.nil?
      flash[:error] = "must be login"
      redirect_to root_url
    end
  end

  def is_user_admin
    unless @current_user.is_admin
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admins_only(&block)
    block.call if current_user.try(:is_admin)
  end

  helper_method :request_login
  helper_method :is_user_admin
  helper_method :admins_only


end
