module Api
  module V1
    class CategoriesController < ApplicationController

      before_filter :restrict_access
      respond_to :json

      def index
        respond_with Category.all
      end


      private
      def restrict_access
        api_key = ApiKey.find(key: params[:key])
        head :unauthorized unless api_key
      end
    end

  end
end