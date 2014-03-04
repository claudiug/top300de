class TripsController < ApplicationController
  helper_method :calculate_distance
  def index
    if params[:location].present?
      if params[:category].present?
        #TODO list by location km and show at the button trips from that city
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
