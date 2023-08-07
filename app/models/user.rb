class User < ApplicationRecord
  # before_create :generate_api_key

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :api_key
  validates_uniqueness_of :api_key
  validates :password, presence: true
  has_secure_password

  # private
  # def generate_api_key
  #   self.api_key = SecureRandom.hex
  # end
end