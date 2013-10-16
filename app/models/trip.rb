class Trip < ActiveRecord::Base
  has_many :hotels
  has_many :restaurants
  has_many :paintings
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :paintings


  def self.search(query)
    where("name like ?", "%#{query}%")
  end




end
