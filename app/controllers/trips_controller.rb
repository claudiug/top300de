class TripsController < ApplicationController

  def index
    if params[:category].nil?
      @trips = Trip.all
    else
      @trips = Trip.joins(:categories).where(categories:{name: params[:category].keys})
    end
  end

  def show

  end

end
