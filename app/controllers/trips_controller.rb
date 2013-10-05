class TripsController < ApplicationController

  def index
    @result = params[:search]
  end

end
