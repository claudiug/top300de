class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {within: 5..100}


  def self.count_admin_user
    where(is_admin: true).count
  end
end
