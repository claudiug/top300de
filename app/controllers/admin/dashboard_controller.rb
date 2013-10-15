class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :request_login



  def index
   @trips = Trip.all
  end
end
