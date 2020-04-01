class User < ApplicationRecord
  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings

  has_many :forums, foreign_key: :user_id, class_name: "Forum", dependent: :destroy
  has_many :subfeds, through: :forums
  has_many :posts, through: :forums
end
