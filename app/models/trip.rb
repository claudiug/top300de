class Trip < ActiveRecord::Base

  has_many :hotels
  has_many :restaurants
  has_many :paintings
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :paintings

  validates :slug, presence: true, uniqueness: true
  validates :name, presense: true
  validates :city, presense: true
  validates :zip_code, presense: true
  validates :description, presense: true
  validates :is_active, presense: true

  before_validation :generate_slug
  before_validation :make_name_titlecase

  def self.search(query)
    where("name like ?", "%#{query}%")
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

end
