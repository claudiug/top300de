class TripsController < ApplicationController
  def index
    if params[:location].present?
      if params[:category].present?
        @trips = Trip.joins(:categories).where(categories: {name: params[:category].keys})
      else
        @trips = Trip.top_ten
      end
    end
    @trips = Trip.top_ten
  end

  def show
    @trip = Trip.find_by(slug: params[:id])
    @weather = Trip.get_weather(@trip)
  end

  def calculate_distance
    #TODO calculate distance use google api and make it helper method
  end

end
