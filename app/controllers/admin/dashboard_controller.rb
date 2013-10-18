

class Admin::DashboardController < ApplicationController
  before_action :request_login
   layout 'admin'


  def index

    if params[:latitude] && params[:longitude]
      get_temperature(params[:latitude], params[:longitude])
    end

  end


  private
  def get_temperature(latitude, longitude)
    @forecast ||= ForecastIO.forecast(latitude, longitude,             #do not use spaces in exclude clause!!!
                                      params: { units: 'si', exclude: 'minutely,hourly,flags,alerts' })

  end



end
