class User < ApplicationRecord
  has_secure_password
  has_many :settings
  has_many :subfeds
  has_many :posts, through: :subfeds
  accepts_nested_attributes_for :settings
end
