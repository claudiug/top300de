class Admin::PaintingsController < ApplicationController
  layout "admin"

  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column

  def index
    @paintings = Painting.search(params[:query]).
        order(sort_column + ' ' + sort_direction).
        page(params[:page]).per_page(5)

  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to [:admin, @painting], notice: "painting was created!"
    else
      render :new
      flash[:warning] = "please fix the errors!"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @painting.update(painting_params)
      redirect_to [:admin, @painting], notice: "painting: was updated!"
    else
      render :edit
      flash[:warning] = "please fix the errors"
    end
  end

  def destroy
    @painting.destroy
    redirect_to admin_paintings_path
    flash[:notice] = "painting was deleted!"
  end

  private

  def painting_params
    params.require(:painting).permit(:name, :trip_id, :is_feature, :is_active, :image, :remote_image_url, :trip_name)
  end

  def set_painting
    @painting = Painting.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "the painting could not be found"
    redirect_to admin_paintings_path
  end

  def sort_column
    if Painting.column_names.include?(params[:sort])
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
