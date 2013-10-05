class Search < ActiveRecord::Base

  def get_trips
    @trips ||= find_all_trips
  end



  private
  def find_all_trips
    trips = Trip.order(:name)
    trips = Trip.where("name like ?", "%#{keyword}") if keyword.present?
    trips = Trip.where(category_id: category_id) if category_id.present?
    trips = Trip.where("price >=?", "%#{min_price}") if min_price.present?
    trips = Trip.where("price <=?", "%#{max_price}") if max_price.present?
    trips

  end
end
