class Admin::RestaurantsController < ApplicationController
  layout "admin"
  before_action :request_login

end
