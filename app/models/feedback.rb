class Feedback < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :comment, presence: true
  validates :pro, presence: true
  validates :contra, presence: true



  def self.count_feedback_by_email(email)
    Feedback.where(:email => email).count
  end
end
