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
  validates :ger_name, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true
  validates :ger_description, presence: true
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

  def self.top_ten
    order(:name).limit(10)
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug = name.try(:parameterize)
  end

  def make_name_titlecase
    self.name = name.try(:titlecase)
  end

  def no_of_hotels
    hotels.count
  end

  def self.get_top_ten
    order(:name).limit(10)
  end

  def self.feature_trips
    where(is_feature: true).limit(6)
    #TODO add random
  end

  def self.get_weather(trip)
    Weather.new(trip).get_weather
  end

  def self.get_random_feature
    where(is_feature: true).rand(1)
  end

  def self.popular_trips
    order("RANDOM()").where(popular: true).limit(9)
  end

  def eng_name
    self.name ? self.name : "-"
  end

  def german_name
    self.ger_name ? self.ger_name : "-"
  end

  def eng_city
    self.city ? self.city : "-"
  end

  def german_city
    self.ger_city ? self.ger_city : "-"
  end

  def eng_description
    self.description ? self.description : "-"
  end

  def german_description
    self.ger_description ? self.ger_description : "-"
  end

  def eng_country
    self.country ? self.country : "-"
  end

  def german_country
    self.ger_country ? self.ger_country : "-"
  end

end
