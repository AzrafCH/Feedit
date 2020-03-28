class User < ApplicationRecord
  has_secure_password
  has_many :settings, inverse_of: :users
  accepts_nested_attributes_for :settings

  has_many :forums, dependent: :destroy, inverse_of: :users
  has_many :subfeds, through: :forums, dependent: :destroy, inverse_of: :users
  has_many :posts, through: :forums, dependent: :destroy, inverse_of: :users
end
