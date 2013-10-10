class Feedback < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true


  def self.count_feedback_by_email(email)
    Feedback.where(:email => email).count
  end
end
