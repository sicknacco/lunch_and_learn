class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :api_key
  validates_uniqueness_of :api_key
  validates :password, presence: true
  has_secure_password
end