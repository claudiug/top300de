class Admin::RestaurantsController < ApplicationController
  layout "admin"
  before_action :request_login
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column


  def index
   @restaurants = Restaurant.order(sort_column + ' ' + sort_direction).page(params[:page]).per_page(5)
  end

  def new
   @restaurant = Restaurant.new
  end

  def create
   @restaurant = Restaurant.new(restaurant_params)
   if @restaurant.save
     redirect_to [:admin, @restaurant], notice: "restaurant created!"
   else
     render :new
   end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to [:admin, @restaurant], notice: "restaurant updated!"
    else
      render :edit
    end

  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :email,:phone_number, :is_active, :web_page)
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "The restaurant #{params[:id]} could not be found"
    redirect_to admin_restaurants_path
  end

  def sort_column
    if Restaurant.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "name"
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:direction]) then
      params[:direction]
    else
      "asc"
    end
  end

end
