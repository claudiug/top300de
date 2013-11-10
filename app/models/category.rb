class Category < ActiveRecord::Base

  has_and_belongs_to_many :trips
  validates :name, presence: true, uniqueness: true
  validates :is_active, presence: true
  validates :description, presence: true
  validates :seo, presence: true
  validates :slug, presence: true, uniqueness: true
  before_validation :make_name_titlecase
  before_validation :generate_slug

  def self.search_for_trips(query)
    joins(:trips).where("trips.name = ?", "#{query}")
  end

  def self.search(query)
    if query
      where("name like ?", "#%{query}%")
    else
      order(:name).limit(10)
    end

  end
  def to_param
    slug
  end

  def generate_slug
    self.slug=name.try(:parameterize)
  end

  def make_name_titlecase
    self.name = name.try(:titlecase)
  end

  def get_categories
     trips.find(get_trips_ids)
  end

  private
  def get_trips_ids
      trip_ids
  end





end
