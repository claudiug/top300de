class TripsController < ApplicationController

  def index
    render text:params.to_json
  end

  def show

  end

end
#Trip.joins(:categories).where(categories:{name: ["Go Hike", "go_hike"]}).count
