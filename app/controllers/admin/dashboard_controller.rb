class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :is_user_admin
  def index
  end
end
