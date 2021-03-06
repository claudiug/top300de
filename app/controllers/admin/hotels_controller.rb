class Admin::HotelsController < ApplicationController
  layout "admin"

  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column

  def index
    @hotels = Hotel.order(sort_column + ' ' + sort_direction).page(params[:page]).per_page(5)
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
  end

  def edit
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to [:admin, @hotel], notice: "hotel updated!"
    else
      render :new
    end
  end

  def destroy
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

  def sort_column
    if Hotel.column_names.include?(params[:sort])
      params[:sort]
    else
      "name"
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:direction])
      params[:direction]
    else
      "asc"
    end
  end
end
