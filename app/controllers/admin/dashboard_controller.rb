
class Admin::DashboardController < ApplicationController
  before_action :request_login
   layout 'admin'


  def index

    if params[:latitude] && params[:longitude]
      get_temperature(params[:latitude], params[:longitude])
    end

  end


  private
  #This should be moved in a new model, to get existing request from db. Maybe make a rake task for saving at some days
  #some information regarding some cities, this NOT be remain as it is now.
  #create a new thread when this method get call and then try to cache it!
  def get_temperature(latitude, longitude)
    @forecast ||= ForecastIO.forecast(latitude, longitude,             #do not use spaces in exclude clause!!!
                                      params: { units: 'si', exclude: 'minutely,hourly,flags,alerts' })

  end



end
