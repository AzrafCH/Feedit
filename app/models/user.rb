class User < ApplicationRecord
  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings

  has_many :forums, dependant: :destroy
  has_many :subfeds, through: :forums, dependant: :destroy
  has_many :posts, through: :forums, dependant: :destroy
end
