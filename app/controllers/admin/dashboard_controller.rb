class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :request_login



  def index
    @category_count ||= Category.count
    count = Hotel.count
    @hotels_count ||= count
    @feedback_count ||= Feedback.count
  end
end
