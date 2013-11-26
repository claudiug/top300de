class DefaultController < ApplicationController
  layout "homepage"

  def home
  end

  def landing

  end

  def contact_us
    name = params[:name] if params[:name].present?
    email = params[:email] if params[:email].present?
    content = params[:content] if params[:content].present?
    @email = [name, email, content]
    ContactMailer.create_feedback_user(@email).deliver
  end

  def join_us
  end

  def term
  end

  def privacy
  end

  def sitemap
  end

  def contribute
  end
end
