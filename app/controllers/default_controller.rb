class DefaultController < ApplicationController

  layout "homepage"

  def home
  end

  def get_lat_and_lgn
    @lat_lgn = cookies[:lat_lgn].split("|")
  end
  helper_method :get_lat_and_lgn

end
