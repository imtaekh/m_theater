class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  validates :first_name, presence: true
  has_many :orders
end
