class DefaultController < ApplicationController

  def home
    #start point of the app, the name will be changed in the routes.rb files!!!
    #TODO change the name in routes.rb
    #TODO get the ip from user, and try see the location and/or is a new or return user


    @query = params[:query]
    #TODO create the result as in models

  end


end
