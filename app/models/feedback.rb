class Feedback < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :comment, presence: true
  validates :pro, presence: true
  validates :contra, presence: true


  def self.search(query)
    if query
      where("name like ?", "%#{query}%")
    else
      order(:name).limit(10)
    end
  end


  def self.count_feedback_by_email(email)
    if email.present?
      Feedback.where(email: email).count
    end
  end
end
