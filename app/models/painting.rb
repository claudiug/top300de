class Painting < ActiveRecord::Base
  belongs_to :trip
  mount_uploader :image, ImageUploader


  validates :image, presence: true
  validates :name, presence: true


  def trip_name
    trip.try(:name)
  end

  def trip_name=(name)
    self.trip = Trip.find_by(name: name) if name.present?
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      order("name").limit(10)
    end
  end
end
