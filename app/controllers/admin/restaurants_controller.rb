class Admin::RestaurantsController < ApplicationController
  layout "admin"
  before_action :request_login
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
   @restaurants = Restaurant.all
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
    #set_restaurant
    #@restaurant = Restaurant.find(params[:id])
  end

  def edit
    #set_restaurant
    #@restaurant = Restaurant.find(params[:id])
  end

  def update
    #set_restaurant
    #@restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to [:admin, @restaurant], notice: "restaurant updated!"
    else
      render :edit
    end

  end

  def destroy
    #set_restaurant
    #@restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private
  def restaurant_params
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "The restaurant #{params[:id]} could not be found"
    redirect_to admin_restaurants_path

  end

end
