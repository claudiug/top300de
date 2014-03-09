class TripsController < ApplicationController
  helper_method :calculate_distance
  def index
    if params[:location].present?
      @location = session[:location] = params[:location] if params[:location]
      flash[:loc] = params[:location]
      if params[:category].present?
        @trips = Trip.joins(:categories).where(categories: {name: params[:category].keys}).page(params[:page]).per_page(5)
      else
        @trips = Trip.top_ten.page(params[:page]).per_page(2)
      end
    end
      @trips = Trip.top_ten.page(params[:page]).per_page(2)
  end

  def show
    @trip = Trip.find_by(slug: params[:id])
    @weather = Trip.get_weather(@trip)
  end

  def calculate_distance(type, from, where)
    case type
      when 'WALKING'
         MapsGoogleDistance.get_distance_by_walking(from, where)
      when 'BIKE'
        MapsGoogleDistance.get_distance_by_bike(from, where)
      when 'CAR'
        MapsGoogleDistance.get_distance_by_car(from, where)
      else
         MapsGoogleDistance.get_distance_by_car(from, where)
    end
  end
end
