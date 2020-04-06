class User < ApplicationRecord
  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings

  has_many :posts, foreign_key: :user_id, class_name: "Post", dependent: :destroy
  has_many :subfeds, through: :posts
end
