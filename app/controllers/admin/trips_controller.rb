class Admin::TripsController < ApplicationController
  layout "admin"

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @trips = Trip.where("name like ?", "%#{params[:query]}%")
    else
      @trips = Trip.all

    end
    # AR TREBUI SA FOLOSESC API
    def load_trips
      @load_trips = Trip.pluck(:name)
      render json: @load_trips, root: false
    end


  end



  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to [:admin, @trip], notice: "trip created!"
    else
     render :new
    end
  end

  def show
    #set_trip
    #@trip = Trip.find(params[:id])
    render text: params
  end

  def edit
    #set_trip
    #@trip = Trip.find(params[:id])
  end

  #noinspection RubyArgCount
  def update
    #set_trip
    #@trip = Trip.find(params[:id])
    if @trip.update(trip_params)
       redirect_to [:admin, @trip], notice: "trip updated!"
    else
       render :edit
    end
  end

  def destroy
    #set_trip
    #@trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to admin_trips_path

  end

  private

  #category_ids[] is used for get all category ids when submiting a form
  def trip_params
    params.require(:trip).permit(:name, {category_ids: []})
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
