class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :http_auth, if: -> {request.path.include?("admin")}
  before_action :set_locale
  helper_method :get_location

  private

  def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
    #other way:
    # current_user.locale  set this in db
    # request.subdomain  select a subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]  get the browser language
    # request.remote_ip   use geocode or some ip lookup for location
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def http_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "trip" && password == "futurama"
    end
  end

  def get_location(loc)
    if loc.present?
      loc
    else
      'Berlin'
    end
  end
end
