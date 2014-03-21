class DefaultController < ApplicationController
  layout "static"

  def about
  end

  def sitemap
  end

  def term
  end

  def privacy
  end

  def sitemap
    @trips = Trip.order('name')
  end

  def contribute
  end
end
