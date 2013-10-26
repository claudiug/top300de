class Admin::TripsController < ApplicationController
  layout "admin"
  before_action :request_login
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @trips = Trip.search(params[:query])
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
    @trip.paintings.build
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

  end

  def edit

  end

  def update
    if @trip.update(trip_params)
       redirect_to [:admin, @trip], notice: "trip updated!"
    else
       render :edit
    end
  end

  def destroy

    @trip.destroy
    redirect_to admin_trips_path, notice: "trip deleted!"
  end

  private

  #category_ids[] is used for get all category ids when submiting a form
  def trip_params
    params.require(:trip).permit(:name,:city,:zip_code, :description, :is_active,
                                 {category_ids: []}, paintings_attributes: [:name, :is_feature, :is_active, :image])
  end

  def set_trip
    @trip = Trip.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Trip #{params[:id]} could not be found"
    redirect_to admin_trips_path
  end

end
