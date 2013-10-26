class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :request_login
  before_action :set_category, only: [:show, :update, :edit, :destroy]


  def index
   @categories = Category.all
  end

  def new
   @category = Category.new
  end

  def create
   @category = Category.new(category_params)
   if @category.save
     redirect_to [:admin, @category], notice: "category created!"
   else
     render :new
     flash[:warning] = "please fix the errors"
   end
  end



  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to [:admin, @category], notice: "category updated!"
    else
      render :edit
    end
    end
  end


  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end



  private

  def category_params
    params.require(:category).permit(:name, :description, :seo, :is_active)
  end

  def set_category
    @category = Category.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "The category that you are looking could not be found"
    redirect_to admin_categories_path
  end



