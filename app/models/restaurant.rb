class Restaurant < ActiveRecord::Base

  belongs_to :trip

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  before_validation :generate_slug
  before_validation :make_name_titlecase

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
    self.slug= name.parameterize
  end

  def make_name_titlecase
    self.name = name.titlecase
  end
end
