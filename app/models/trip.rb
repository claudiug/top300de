class Trip < ActiveRecord::Base
  has_many :hotels
  has_many :restaurants
  has_and_belongs_to_many :categories

  def self.search(query)
    where("name like ?", "%#{query}%")
  end


end
