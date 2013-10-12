class Category < ActiveRecord::Base
  has_and_belongs_to_many :trips
  validates :name, presence: true, uniqueness: true
  validates :is_active, presence: true
  validates :description, presence: true
  validates :seo, presence: true

  def self.search(query)
    #TODO
  end
end
