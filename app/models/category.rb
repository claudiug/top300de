class Category < ActiveRecord::Base
  has_and_belongs_to_many :trips
  validates :name, presence: true

  def self.search(query)
    #TODO
  end
end
