class Admin::HotelsController < ApplicationController
  layout "admin"
  before_action :request_login
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
   @hotel = Hotel.new(hotel_params)
   if @hotel.save
     redirect_to [:admin, @hotel], notice: "hotel created!"
   else
     render :new
   end
  end

  def show
  #set_hotel
   #@hotel = Hotel.find(params[:id])
  end

  def edit
    #set_hotel
    #@hotel = Hotel.find(params[:id])
  end

  def update
    #set_hotel
    #@hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      redirect_to [:admin, @hotel], notice: "hotel updated!"
    else
      render :new
    end
  end

  def destroy
    #set_hotel
    #@hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to admin_hotels_path
  end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :address, :trip_id, :city_id, :rating, :phone_number, :email, :web_page,
                                  :is_active, :slug)
  end

  def set_hotel
    @hotel = Hotel.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "The hotel: #{@hotel.name} could not be found"
    redirect_to admin_hotels_path
  end

end
