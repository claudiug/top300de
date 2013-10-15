class Admin::DashboardController < ApplicationController
  before_action :request_login
   layout 'admin'


  def index
  end


end
