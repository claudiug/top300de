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
   end
  end



  def show
    #set_category
   #@category = Category.find(params[:id])
  end

  def edit
    #set_category
    #@category = Category.find(params[:id])
  end

  def update
    #set_category
    #@category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to [:admin, @category], notice: "category updated!"
    else
      render :edit
    end
    end
  end

  def destroy
    #set_category
    #@category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end



