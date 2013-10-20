class Category < ActiveRecord::Base
  has_and_belongs_to_many :trips
  validates :name, presence: true, uniqueness: true
  validates :is_active, presence: true
  validates :description, presence: true
  validates :seo, presence: true

  def self.search_for_trips(query)
    joins(:trips).where("trips.name = ?", "#{query}")
  end
end
