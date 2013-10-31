class TripsController < ApplicationController
  include ActiveModel::Serializers::JSON


  def index
    if params[:category].nil?
      @trips = Trip.all
    else
      @trips = Trip.joins(:categories).where(categories:{name: params[:category].keys})
    end
  end

  def show
    @trip = Trip.find_by(slug: params[:id])
    @weather = Trip.get_weather(@trip)
  end

end
