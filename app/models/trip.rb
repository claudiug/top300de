class Trip < ActiveRecord::Base

  has_many :hotels
  has_many :restaurants
  has_many :paintings
  has_one :daily
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :paintings
  geocoded_by :name
  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true
  validates :is_active, presence: true


  before_validation :generate_slug
  before_validation :make_name_titlecase
  after_validation :geocode

  scope :is_active, -> {where(is_active: true)}
  scope :is_inactive, -> {where(is_active: false)}
  #default_scope {is_active}

  def self.search(query)
    if query
      where("name like ?", "%#{query}%")
    else
      order(:name).limit(10)
    end
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug = name.parameterize
  end

  def make_name_titlecase
    self.name = name.titlecase
  end

  def no_of_hotels
    hotels.count
  end

  def self.get_top_ten
    order(:name).limit(10)
  end

  #after validation
  # get the trip object
  # use geocoder to create lat and long
  # save it
  #



  def self.get_weather(trip)
    Weather.new(trip).get_weather
  end



end
