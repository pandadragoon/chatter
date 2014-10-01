class User < ActiveRecord::Base

  has_many :statuses

  has_secure_password validations: false

  validates :username, presence: true
  validates :email, presence: true
end