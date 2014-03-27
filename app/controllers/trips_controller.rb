require 'will_paginate/array'
class TripsController < ApplicationController
  helper_method :calculate_distance

  def index

    if params[:location].present?
      #cookies[:is_from_ror] = { value: params[:location], expires: 24.hour.from_now }
      @location = session[:location] = params[:location] if params[:location]
      flash[:loc] = params[:location]
   end
   if params[:category].present?
        categories = Category.where(name: params[:category].keys.map(&:humanize))
        trip_ids = categories.map{|cat| cat.trips.map(&:id)}.flatten.uniq
        @trips  = Trip.find(trip_ids).paginate(:page => params[:page], :per_page => 12)
      else
        @trips = Trip.top_ten.page(params[:page]).per_page(12)
      end
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

  def send_link
    contact = Contact.new(params)
    contact.remote_ip = request.remote_ip
    if contact.save
      SendDirection.new(contact).deliver
    end
  end

end
