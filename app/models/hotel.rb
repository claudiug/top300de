class Hotel < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :trip


end
