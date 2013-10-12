class Hotel < ActiveRecord::Base

  validates :is_active, :name, :rating, :phone_number, :email, :web_page, presence: true
  belongs_to :trip


end
