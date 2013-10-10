class CategoriesController < ApplicationController
  before_filter :restrict_access
  respond_to :json

  def index
    renspond_with :Category.all
  end



  private
  def restrict_access
    api_key = ApiKey.find(params[:token])
  end
end