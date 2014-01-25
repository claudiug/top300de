class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :set_category, only: [:show, :update, :edit, :destroy]
  helper_method :sort_direction, :sort_column

  def index
    @categories = Category.order(sort_column + ' ' + sort_direction).page(params[:page]).per_page(5)
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

def sort_column
  if Category.column_names.include?(params[:sort])
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

